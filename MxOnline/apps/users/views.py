import json
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout #Django认证的方法用于登录
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password #用户注册时候加密密码

from .forms import *
from .models import *
from utils.email_send import send_register_email, email_pwd_tx, email_upload
from utils.mixin_utils import LoginRequiredMIxin
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from operation.models import UserCourse, UserFavorite, UserMessage
from courses.models import Coures
from organization.models import CourseOrg, Teacher

#使用类来做登陆验证
class LoginView(View):
    def get(self, request):
        return render(request, "login.html", locals())

    def post(self, request):
        login_form = Login_Form(request.POST)
        if login_form.is_valid():
            user_name = request.POST.get("username", "")
            pass_word = request.POST.get("password", "")
            user = authenticate(username=user_name, password=pass_word)
            if user is not None:
                if user.is_jh:
                    login(request, user)
                    return HttpResponseRedirect("/") #登陆成功后跳转到首页
                else:
                    msg = "用户未激活"
                    return render(request, "login.html", locals())
            else:
                msg = "用户名密码错误"
                return render(request, "login.html", locals())
        else:
            return render(request, "login.html", locals())

#用户退出功能
class LogOutView(View):
    def get(self, request):
        logout(request)
        return HttpResponseRedirect("/") #退出成功以后跳转到首页
# # Create your views here.
# def user_login(request):
#     #使用函数登录验证
#     if request.method == "POST":
#         user_name = request.POST.get("username", "")
#         pass_word = request.POST.get("password", "")
#         user = authenticate(username=user_name, password=pass_word)
#         if user is not None:
#             login(request,user)
#             return render(request, "index.html")
#         else:
#             return render(request, "login.html", locals())
#     elif request.method != "POST":
#         return render(request, "login.html", locals())

#注册功能
class RegisterView(View):
    def get(self, request):
        register_Form = RegisterForm() #生成验证码
        return render(request, "register.html", locals())

    def post(self, request):
        register_Form = RegisterForm(request.POST)
        if register_Form.is_valid():
            userProFile = UserProFile()
            new_name = request.POST.get("email")
            if UserProFile.objects.filter(email=new_name):
                msg = "用户名已存在"
                return render(request, "register.html", locals())

            new_pass = request.POST.get("password")
            userProFile.username = new_name
            userProFile.email = new_name
            userProFile.is_jh = False
            userProFile.password = make_password(new_pass)
            userProFile.save()
            #写入用户注册消息
            user_message = UserMessage()
            user_message.user = userProFile.id
            user_message.message = "欢迎%s注册, 让我们一起学习, 一起成长吧！"%new_name
            user_message.save()
            #写入用户注册消息
            send_register_email(new_name, "register")
            return render(request, "login.html", locals())
        else:
            return render(request, "register.html", locals())

#用户激活
class AciveUserView(View):
    def get(self, request, active_code):
        try:
            all_records = EmailVerifyRecord.objects.filter(code=active_code)
            records = EmailVerifyRecord.objects.get(code=active_code)
            if all_records:
                for record in all_records:
                    if records.is_sx:
                        email = record.email
                        #用户激活
                        user = UserProFile.objects.get(email=email)
                        user.is_jh = True
                        user.save()
                        #邮箱验证码只能使用一次
                        records.is_sx = False
                        records.save()
                    else:#验证码禁止重复使用
                        msg = "这位君，抱歉！链接失效啦~"
                        return render(request, "active_fail.html", locals())
            else:#用户不存在
                msg = "这位君，抱歉！链接失效啦~"
                return render(request, "active_fail.html", locals())
        except:
            msg = "您访问的页面去了火星"
            return render(request, "active_fail.html", locals())
        return render(request, "login.html")


#修改密码==重置密码
class ForgetPwdView(View):
    def get(self, request):
        forgetPwdForm = ForgetPwdForm()
        return render(request, "forgetpwd.html", locals())

    def post(self, request):
        forgetPwdForm = ForgetPwdForm(request.POST)
        email_name = request.POST.get("email", "")
        if forgetPwdForm.is_valid():
            try:
                if UserProFile.objects.get(email=email_name):
                    send_register_email(email_name, "forget")
                    msg = "邮件发送成功,快去邮箱查收吧！"
                    return render(request, "active_fail.html", locals())
                else:
                    msg = "邮箱不存在"
                    return render(request, "forgetpwd.html", locals())
            except:
                msg = "邮箱不存在"
                return render(request, "forgetpwd.html", locals())
        else:
            return render(request, "forgetpwd.html", locals())

#重置密码链接
class ResetView(View):

    def get(self, request, active_code):
        try:
            all_records = EmailVerifyRecord.objects.filter(code=active_code)
            records = EmailVerifyRecord.objects.get(code=active_code)
            code = active_code
            if all_records:
                for record in all_records:
                    pass
                    if records.is_sx:
                        email = record.email
                        # #用户激活
                        # user = UserProFile.objects.get(email=email)
                        # user.is_jh = True
                        # user.save()
                        # #邮箱验证码只能使用一次
                        # records.is_sx = False
                        # records.save()
                        return render(request, "password_reset.html", locals())
                    else:#验证码禁止重复使用
                        msg = "这位君，抱歉！链接失效啦~"
                        return render(request, "active_fail.html", locals())
            else:#用户不存在
                msg = "这位君，抱歉！链接失效啦~"
                return render(request, "active_fail.html", locals())
        except:
            msg = "您访问的页面去了火星"
            return render(request, "active_fail.html", locals())

        return render(request, "password_reset.html")

#邮箱修改密码
class ModifiPwdView(View):
    def post(self, request):
        mo_Pwd = MoforPwdForm(request.POST)
        code = request.POST.get("code", "")
        email = request.POST.get("email", "")
        emails = EmailVerifyRecord.objects.get(code=code)
        if mo_Pwd.is_valid():
            if emails.is_sx:
                pwd1 = request.POST.get("password1","")
                pwd2 = request.POST.get("password2","")
                if pwd1 != pwd2:
                    msg = "密码不相等"
                    return render(request, "password_reset.html", locals())
                user = UserProFile.objects.get(email=email)
                emails.is_sx = False
                user.password = make_password(pwd1)
                user.save()
                emails.save()
                email_pwd_tx(email, "OK", pwd2)
                return render(request, "login.html", locals())
            else:
                msg = "密码重置链接已经失效！抱歉"
                return render(request, "active_fail.html", locals())
        else:
            return render(request, "password_reset.html")

#用户的个人中心
class UserInfoView(LoginRequiredMIxin, View): #继承，如果用户没有登陆就跳到登陆界面
    def get(self, request):#用户的个人信息
        mig = "grzl"
        #user_info = UserProFile.objects.get(username=request.user)
        return render(request, "usercenter-info.html", locals())

    # 使用表单来修改用户中心的昵称手机地址等信息
    def post(self, request):
        user_info = UploadinfoForm(request.POST, instance=request.user)
        if user_info.is_valid():
            user_info.save()
            return HttpResponse('{"status":"success", "msg":"修改成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail", "msg":"修改失败"}', content_type='application/json')


#用户修改头像
class UploadImageView(LoginRequiredMIxin, View):
    def post(self, request):
        image_form = UploadImageForm(request.POST, request.FILES, instance=request.user)
        if image_form.is_valid():
            image_form.save()
            return HttpResponse('{"status":"success", "msg":"修改成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail", "msg":"修改失败"}', content_type='application/json')

#用户中心修改密码
class UpLoadPwdView(LoginRequiredMIxin,View):
    def post(self, request):
        mo_Pwd = MoforPwdForm(request.POST)
        if mo_Pwd.is_valid():
            pwd1 = request.POST.get("password1","")
            pwd2 = request.POST.get("password2","")
            if pwd1 != pwd2:
                return HttpResponse('{"status":"fail", "msg":"密码不相等"}', content_type='application/json')
            user = request.user
            user.password = make_password(pwd1)
            user.save()
            return HttpResponse('{"status":"success", "msg":"修改成功"}', content_type='application/json')
        else:
            return HttpResponse(json.dumps(modify_form.errors ), content_type='application/json')

#发送邮箱验证码在个人中心修改邮箱
class SenderEmailCodeView(LoginRequiredMIxin, View):
    def get(self, request):
        email = request.GET.get("email", "")
        if UserProFile.objects.filter(email=email):
            return HttpResponse('{"email":"邮箱不可用"}', content_type='application/json')
        send_register_email(email, "upload_email")
        return HttpResponse('{"status":"success"}', content_type='application/json')

#验证用户中心的邮箱和验证码是否相等，如果相等就修改
class YanZhengEmailView(LoginRequiredMIxin, View):
    def post(self, request):
        try:
            email = request.POST.get("email", "")
            code = request.POST.get("code", "")
            if code:
                emails = EmailVerifyRecord.objects.get(email=email, code=code, send_type="upload_email")
                if emails:
                    if emails.is_sx: #判断验证码是否有效
                        user_email = request.user
                        user_email.email = email
                        emails.is_sx = False #让验证码只能使用一次
                        user_email.save()
                        emails.save()
                        email_upload(email, "OK")
                        return HttpResponse('{"status":"success"}', content_type='application/json')
                    else:
                        return HttpResponse('{"email":"验证码失效"}', content_type='application/json')
            else:
                return HttpResponse('{"email":"验证码不能为空"}', content_type='application/json')
        except:
            return HttpResponse('{"email":"验证码不存在"}', content_type='application/json')



#修改用户中心的昵称-生日-性别-地址-手机号-不使用form的情况下---->没有使用
class UploadUserInfoView(LoginRequiredMIxin, View):
    def post(self, request):
        nick_name = request.POST.get("nick_name", "") #获取新的昵称
        birday = request.POST.get("birday", "") #获取新的生日
        gender = request.POST.get("gender", "") #获取新的性别
        address = request.POST.get("address", "") #获取新的地址
        mobile = request.POST.get("mobile", "") #获取新的手机号
        # print(request.POST)
        # user_info_form = UploadinfoForm()
        # print(user_info_form)
        if True:
            user = request.user
            user.nick_name = nick_name
            user.birday = birday
            user.gender = gender
            user.address = address
            user.mobile = mobile
            user.save()
            return HttpResponse('{"status":"success", "msg":"修改成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail", "msg":"修改失败"}', content_type='application/json')



#显示用户中心的我学习过的课程
class MycourseView(LoginRequiredMIxin, View):
    def get(self, request):
        mig = "wdkc"
        usercourse = UserCourse.objects.filter(user=request.user)
        return render(request, "usercenter-mycourse.html", locals())



#用来显示用户中心的收藏的公开课
class MyFavCourseView(LoginRequiredMIxin, View):
    def get(self, request):
        mig = "yhsc"
        user_courses = []
        user_course = UserFavorite.objects.filter(user=request.user, fav_type=1)
        for uif in user_course:
            uid = uif.fav_id
            user_course = Coures.objects.get(id=int(uid))
            user_courses.append(user_course)
        return render(request, "usercenter-fav-course.html", locals())



#用来显示用户中心的机构的课程收藏
class MyFavOrgView(LoginRequiredMIxin, View):
    def get(self, request):
        mig = "yhsc"
        userOrg = []
        user_fav = UserFavorite.objects.filter(user=request.user, fav_type=2)
        for uif in user_fav:
            uid = uif.fav_id
            user_fav_org = CourseOrg.objects.get(id=int(uid))
            userOrg.append(user_fav_org)
        return render(request, "usercenter-fav-org.html", locals())



#用来显示用户中心的用户收藏的教师
class MyFavTeacherView(LoginRequiredMIxin, View):
    def get(self, request):
        mig = 'yhsc'
        user_teacher = []
        user_fav = UserFavorite.objects.filter(user=request.user, fav_type=3)
        for uif in user_fav:
            uid = uif.fav_id
            user_teachers = Teacher.objects.get(id=int(uid))
            user_teacher.append(user_teachers)
        return render(request, "usercenter-fav-teacher.html", locals())



#用来删除用户中心收藏的讲师 --》课程 --》机构
class RemUserCenterView(LoginRequiredMIxin, View):
    def post(self, request):
        fav_type = request.POST.get("fav_type", 0)
        fav_id = request.POST.get("fav_id", 0)
        if int(fav_type) == 1:
            #删除用户中心的课程
            UserFavorite.objects.filter(fav_type=1, fav_id=fav_id).delete()
            return HttpResponse('{"status":"success", "msg":"删除成功"}', content_type='application/json')
        elif int(fav_type) == 2:
            #删除用户中心用户收藏的机构
            UserFavorite.objects.filter(fav_type=2, fav_id=fav_id).delete()
            return HttpResponse('{"status":"success", "msg":"删除成功"}', content_type='application/json')
        elif int(fav_type) == 3:
            #删除用户中心用户收藏的课程
            UserFavorite.objects.filter(fav_type=3, fav_id=fav_id).delete()
            return HttpResponse('{"status":"success", "msg":"删除成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail", "msg":"删除失败"}', content_type='application/json')



#用来展示用户中心的用户消息
class UserMessageView(LoginRequiredMIxin, View):
    def get(self, request):
        mig = "yhxx"
        all_message = UserMessage.objects.filter(user=request.user.id)
        # 对消息进行分页
        try:
            page = request.GET.get('page', 1)
            p = Paginator(all_message, 4, request=request)
            message = p.page(page)
            all_message.update(has_read=True) #当用户浏览消息的时候，把消息设置为已读
        except EmptyPage:
            page = 1
            message = p.page(page)
        except PageNotAnInteger:
            page = 1
            message = p.page(page)
        except:
            page = 1
            message = p.page(page)
        return render(request, "usercenter-message.html", locals())

#首页视图
class IndexView(View):
    def get(self, request):
        banner = Banner.objects.all().order_by("index")[:8] #首页的轮播图
        course_tg = Coures.objects.filter(is_tg=True).order_by("-id")[:5] #首页课程的轮播图
        course = Coures.objects.filter(is_tg=False).order_by("-id")[:6] #获取首页全部课程，去除推广的课程
        org_list = CourseOrg.objects.all().order_by("-id")[:15] #取出首页的课程机构
        return render(request, "index.html", locals())


#全局404页面处理
def page_not_found(request):
    from django.shortcuts import render_to_response
    response = render_to_response('404.html', {})
    response.status_code = 404
    return response

#全局500页面出来
def page_error(request):
    from django.shortcuts import render_to_response
    response = render_to_response('500.html', {})
    response.status_code = 500
    return response

#全局403页面出来
def page_403error(request):
    from django.shortcuts import render_to_response
    response = render_to_response('403.html', {})
    response.status_code = 403
    return response


