import json
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password

from .forms import *
from .models import *
from utils.email_send import send_register_email, email_pwd_tx, email_upload
from utils.mixin_utils import LoginRequiredMIxin
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from operation.models import UserCourse, UserFavorite, UserMessage
from courses.models import Coures
from organization.models import CourseOrg, Teacher


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
                    return HttpResponseRedirect("/")
                else:
                    msg = "用户未激活"
                    return render(request, "login.html", locals())
            else:
                msg = "用户名密码错误"
                return render(request, "login.html", locals())
        else:
            return render(request, "login.html", locals())


class LogOutView(View):
    def get(self, request):
        logout(request)
        return HttpResponseRedirect("/")



class RegisterView(View):
    def get(self, request):
        register_Form = RegisterForm()
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
            user_message = UserMessage()
            user_message.user = userProFile.id
            user_message.message = "欢迎%s注册, 让我们一起学习, 一起成长吧！"%new_name
            user_message.save()
            send_register_email(new_name, "register")
            return render(request, "login.html", locals())
        else:
            return render(request, "register.html", locals())


class AciveUserView(View):
    def get(self, request, active_code):
        try:
            all_records = EmailVerifyRecord.objects.filter(code=active_code)
            records = EmailVerifyRecord.objects.get(code=active_code)
            if all_records:
                for record in all_records:
                    if records.is_sx:
                        email = record.email
                        user = UserProFile.objects.get(email=email)
                        user.is_jh = True
                        user.save()
                        records.is_sx = False
                        records.save()
                    else:
                        msg = "这位君，抱歉！链接失效啦~"
                        return render(request, "active_fail.html", locals())
            else:
                msg = "这位君，抱歉！链接失效啦~"
                return render(request, "active_fail.html", locals())
        except:
            msg = "您访问的页面去了火星"
            return render(request, "active_fail.html", locals())
        return render(request, "login.html")



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
                        return render(request, "password_reset.html", locals())
                    else:
                        msg = "这位君，抱歉！链接失效啦~"
                        return render(request, "active_fail.html", locals())
            else:
                msg = "这位君，抱歉！链接失效啦~"
                return render(request, "active_fail.html", locals())
        except:
            msg = "您访问的页面去了火星"
            return render(request, "active_fail.html", locals())

        return render(request, "password_reset.html")


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


class UserInfoView(LoginRequiredMIxin, View):
    def get(self, request):
        mig = "grzl"
        return render(request, "usercenter-info.html", locals())


    def post(self, request):
        user_info = UploadinfoForm(request.POST, instance=request.user)
        if user_info.is_valid():
            user_info.save()
            return HttpResponse('{"status":"success", "msg":"修改成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail", "msg":"修改失败"}', content_type='application/json')



class UploadImageView(LoginRequiredMIxin, View):
    def post(self, request):
        image_form = UploadImageForm(request.POST, request.FILES, instance=request.user)
        if image_form.is_valid():
            image_form.save()
            return HttpResponse('{"status":"success", "msg":"修改成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail", "msg":"修改失败"}', content_type='application/json')


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


class SenderEmailCodeView(LoginRequiredMIxin, View):
    def get(self, request):
        email = request.GET.get("email", "")
        if UserProFile.objects.filter(email=email):
            return HttpResponse('{"email":"邮箱不可用"}', content_type='application/json')
        send_register_email(email, "upload_email")
        return HttpResponse('{"status":"success"}', content_type='application/json')


class YanZhengEmailView(LoginRequiredMIxin, View):
    def post(self, request):
        try:
            email = request.POST.get("email", "")
            code = request.POST.get("code", "")
            if code:
                emails = EmailVerifyRecord.objects.get(email=email, code=code, send_type="upload_email")
                if emails:
                    if emails.is_sx:
                        user_email = request.user
                        user_email.email = email
                        emails.is_sx = False
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



class UploadUserInfoView(LoginRequiredMIxin, View):
    def post(self, request):
        nick_name = request.POST.get("nick_name", "")
        birday = request.POST.get("birday", "")
        gender = request.POST.get("gender", "")
        address = request.POST.get("address", "")
        mobile = request.POST.get("mobile", "")
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




class MycourseView(LoginRequiredMIxin, View):
    def get(self, request):
        mig = "wdkc"
        usercourse = UserCourse.objects.filter(user=request.user)
        return render(request, "usercenter-mycourse.html", locals())




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




class RemUserCenterView(LoginRequiredMIxin, View):
    def post(self, request):
        fav_type = request.POST.get("fav_type", 0)
        fav_id = request.POST.get("fav_id", 0)
        if int(fav_type) == 1:
            UserFavorite.objects.filter(fav_type=1, fav_id=fav_id).delete()
            return HttpResponse('{"status":"success", "msg":"删除成功"}', content_type='application/json')
        elif int(fav_type) == 2:
            UserFavorite.objects.filter(fav_type=2, fav_id=fav_id).delete()
            return HttpResponse('{"status":"success", "msg":"删除成功"}', content_type='application/json')
        elif int(fav_type) == 3:
            UserFavorite.objects.filter(fav_type=3, fav_id=fav_id).delete()
            return HttpResponse('{"status":"success", "msg":"删除成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail", "msg":"删除失败"}', content_type='application/json')




class UserMessageView(LoginRequiredMIxin, View):
    def get(self, request):
        mig = "yhxx"
        all_message = UserMessage.objects.filter(user=request.user.id)
        try:
            page = request.GET.get('page', 1)
            p = Paginator(all_message, 4, request=request)
            message = p.page(page)
            all_message.update(has_read=True)
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


class IndexView(View):
    def get(self, request):
        banner = Banner.objects.all().order_by("index")[:8]
        course_tg = Coures.objects.filter(is_tg=True).order_by("-id")[:5]
        course = Coures.objects.filter(is_tg=False).order_by("-id")[:6]
        org_list = CourseOrg.objects.all().order_by("-id")[:15]
        return render(request, "index.html", locals())



def page_not_found(request):
    from django.shortcuts import render_to_response
    response = render_to_response('404.html', {})
    response.status_code = 404
    return response


def page_error(request):
    from django.shortcuts import render_to_response
    response = render_to_response('500.html', {})
    response.status_code = 500
    return response


def page_403error(request):
    from django.shortcuts import render_to_response
    response = render_to_response('403.html', {})
    response.status_code = 403
    return response


