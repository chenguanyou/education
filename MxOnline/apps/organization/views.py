from django.shortcuts import render
from django.views.generic.base import View
from django.conf import settings
from django.http import HttpResponse
from django.db.models import Q
import re
from django.shortcuts import render_to_response

from pure_pagination import Paginator, EmptyPage, PageNotAnInteger

from .models import *
from .forms import *
from operation.models import UserAsk
from courses.models import Coures


#机构列表与排序
class Org_listView(View):
    def get(self, request):
        pd = "skjg"
        media_url = settings.MEDIA_URL

        #课程机构
        all_orgs = CourseOrg.objects.all()
        org_nums = all_orgs.count()

        #对机构进行搜索
        search_key = request.GET.get("keywords", "")
        if search_key:
            all_orgs = all_orgs.filter(Q(name__icontains=search_key)|Q(desc__icontains=search_key))

        #点击数量排序
        hot_orgs = all_orgs.order_by("-click_nums")[:5]

        #城市筛选
        all_titys = CityDict.objects.all()
        city_id = request.GET.get("city","")
        if city_id:
            all_orgs = all_orgs.filter(city_id=int(city_id))

        #对机构类别进行赛选
        category = request.GET.get("ct","")
        if category:
            all_orgs = all_orgs.filter(catgory=category)
        num = len(all_orgs)

        #课程数量排序
        students = request.GET.get("sort","")
        if students:
            if students == "count":
                all_orgs = all_orgs.order_by("-kcs")
            elif students =="stu":
                all_orgs = all_orgs.order_by("-xxrs")

        #对课程机构进行分页
        try:
            page = request.GET.get('page', 1)
            p = Paginator(all_orgs, 4, request=request)
            orgs = p.page(page)
        except EmptyPage :
            page = 1
            orgs = p.page(page)
        except PageNotAnInteger:
            page = 1
            orgs = p.page(page)
        except:
            page = 1
            orgs = p.page(page)
        return render(request, "org-list.html", locals())

#添加我要学习信息交互用户的报名
class Add_xinxi(View):
    def post(self, request):
        xintj = Xinxi_Form(request.POST)
        #验证手机号码
        REGEX_MOBILE = "^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$"
        p = re.compile(REGEX_MOBILE)
        if p.match(request.POST.get("mobile")):
            p = re.compile(REGEX_MOBILE)
            if xintj.is_valid():
                user_ask = xintj.save(commit=True)
                return HttpResponse('{"status":"success", "msg":"添加成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail", "msg":"添加出错"}', content_type='application/json')


#机构的详情页面
class OrgHomeView(View):
    def get(self, request, org_id):
        msg = 'home'
        #判断是否收藏
        has_fav = False
        course_org = CourseOrg.objects.get(id=int(org_id))
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=int(course_org.id), fav_type=2):
                has_fav = True
        #判断是否收藏
        all_courses = course_org.coures_set.all()[:3]  #通过机构的信息外键来取出对应的所有课程
        all_teacher = course_org.teacher_set.all()[:1 ] #通过课程的机构外键来取出机构内所有的老师
        return render(request, "org-detail-homepage.html", locals())

#机构课程列表
class OrgCourseView(View):
    def get(self, request, org_id):
        msg = 'jgkc'
        # 判断是否收藏
        has_fav = False
        course_org = CourseOrg.objects.get(id=int(org_id))
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=int(course_org.id), fav_type=2):
                has_fav = True
        # 判断是否收藏
        all_courses = course_org.coures_set.all()
        #对课程列表进行分页
        try:
            page = request.GET.get('page', 1)
            p = Paginator(all_courses, 8, request=request)
            orgs = p.page(page)
        except EmptyPage :
            page = 1
            orgs = p.page(page)
        except PageNotAnInteger:
            page = 1
            orgs = p.page(page)
        except:
            page = 1
            orgs = p.page(page)
        return render(request, "org-detail-course.html", locals())

#机构详情页面
class OrgDescView(View):
    def get(self, request, org_id):
        msg = "desc"
        course_org = CourseOrg.objects.get(id=int(org_id))
        # 判断是否收藏
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=int(course_org.id), fav_type=2):
                has_fav = True
        # 判断是否收藏
        return render(request, "org-detail-desc.html", locals())

#机构讲师页面
class OrgTeachersView(View):
    def get(self, request, org_id):
        msg = "teac"
        course_org = CourseOrg.objects.get(id=int(org_id))
        # 判断是否收藏
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=int(course_org.id), fav_type=2):
                has_fav = True
        # 判断是否收藏
        teachers_org = course_org.teacher_set.all()
        for name in teachers_org:
            kctj = Coures.objects.filter(kcjs_org=name)
            kctj2 = len(kctj)

        return render(request, "org-detail-teachers.html", locals())

#用户收藏和用户取消收藏
class AddFavView(View):
    def post(self, request):
        fav_id = request.POST.get('fav_id', 0)
        fav_type = request.POST.get('fav_type', 0)

        if not request.user.is_authenticated():
            #判断用户登录状态
            return HttpResponse('{"status":"fail", "msg":"用户未登录"}', content_type='application/json')

        exist_records = UserFavorite.objects.filter(user=request.user, fav_id=int(fav_id), fav_type=int(fav_type))
        if exist_records:
            #如果记录已经存在， 则表示用户取消收藏
            exist_records.delete()
            if int(fav_type) == 1:
                course = Coures.objects.get(id=int(fav_id))
                course.fav_nums -= 1
                if course.fav_nums < 0:
                    course.fav_nums = 0
                course.save()
            elif int(fav_type) == 2:
                course_org = CourseOrg.objects.get(id=int(fav_id))
                course_org.fav_nums -= 1
                if course_org.fav_nums < 0:
                    course_org.fav_nums = 0
                course_org.save()
            elif int(fav_type) == 3:
                teacher = Teacher.objects.get(id=int(fav_id))
                teacher.fav_num -= 1
                if teacher.fav_num < 0:
                    teacher.fav_num = 0
                teacher.save()
            return HttpResponse('{"status":"success", "msg":"收藏"}', content_type='application/json')
        else:
            user_fav = UserFavorite()
            if int(fav_id) > 0 and int(fav_type) > 0:
                user_fav.user = request.user
                user_fav.fav_id = int(fav_id)
                user_fav.fav_type = int(fav_type)
                user_fav.save()

                if int(fav_type) == 1:
                    course = Coures.objects.get(id=int(fav_id))
                    course.fav_nums += 1
                    course.save()
                elif int(fav_type) == 2:
                    course_org = CourseOrg.objects.get(id=int(fav_id))
                    course_org.fav_nums += 1
                    course_org.save()
                elif int(fav_type) == 3:
                    teacher = Teacher.objects.get(id=int(fav_id))
                    teacher.fav_num += 1
                    teacher.save()

                return HttpResponse('{"status":"success", "msg":"已收藏"}', content_type='application/json')
            else:
                return HttpResponse('{"status":"fail", "msg":"收藏出错"}', content_type='application/json')

#讲师列表页面
class TeachersListViews(View):
    def get(self, request):
        pd = "skjs"
        teachers_lists = Teacher.objects.all()
        teachers_shul = len(teachers_lists)
        #对讲师的人气进行排行
        sort = request.GET.get('sort', "")
        if sort:
            if sort == "hot":
                all_teachers = teachers_lists.order_by("-click_num")
        sorted_teacher = Teacher.objects.all().order_by("-click_num")[:10]
        #对讲师进行搜索
        search_key = request.GET.get("keywords", "")
        if search_key:
            teachers_lists = teachers_lists.filter(Q(name__icontains=search_key))
        #对讲师列表进行分页
        try:
            page = request.GET.get('page', 1)
            p = Paginator(teachers_lists, 4, request=request)
            orgs = p.page(page)
        except EmptyPage :
            page = 1
            orgs = p.page(page)
        except PageNotAnInteger:
            page = 1
            orgs = p.page(page)
        except:
            page = 1
            orgs = p.page(page)
        return render(request, 'teachers-list.html', locals())

#讲师的详情页面
class TeacherDetailViews(View):
    def get(self, request, teacher_id):
        pd = "skjs"
        teacher_detail = Teacher.objects.get(id=int(teacher_id)) #取出教师信息和所在的机构信息
        teacher_detail.click_num += 1
        teacher_detail.save()
        all_courses = Coures.objects.filter(kcjs_org=teacher_detail) #取出教师的课程信息
        teacher_px = Teacher.objects.all().order_by("click_num")[:3]
        # 判断是否收藏
        #print(teacher_detail.org.id)
        has_jg = False
        has_js = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=teacher_detail.id, fav_type=3):
                has_js = True

            if UserFavorite.objects.filter(user=request.user, fav_id=teacher_detail.org.id, fav_type=2):
                has_jg = True
                # 判断是否收藏
        return render(request, "teacher-detail.html", locals())


