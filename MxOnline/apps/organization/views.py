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



class Org_listView(View):
    def get(self, request):
        pd = "skjg"
        media_url = settings.MEDIA_URL
        all_orgs = CourseOrg.objects.all()
        org_nums = all_orgs.count()
        search_key = request.GET.get("keywords", "")
        if search_key:
            all_orgs = all_orgs.filter(Q(name__icontains=search_key)|Q(desc__icontains=search_key))
        hot_orgs = all_orgs.order_by("-click_nums")[:5]
        all_titys = CityDict.objects.all()
        city_id = request.GET.get("city","")
        if city_id:
            all_orgs = all_orgs.filter(city_id=int(city_id))
        category = request.GET.get("ct","")
        if category:
            all_orgs = all_orgs.filter(catgory=category)
        num = len(all_orgs)
        students = request.GET.get("sort","")
        if students:
            if students == "count":
                all_orgs = all_orgs.order_by("-kcs")
            elif students =="stu":
                all_orgs = all_orgs.order_by("-xxrs")
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


class Add_xinxi(View):
    def post(self, request):
        xintj = Xinxi_Form(request.POST)
        REGEX_MOBILE = "^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$"
        p = re.compile(REGEX_MOBILE)
        if p.match(request.POST.get("mobile")):
            p = re.compile(REGEX_MOBILE)
            if xintj.is_valid():
                user_ask = xintj.save(commit=True)
                return HttpResponse('{"status":"success", "msg":"添加成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail", "msg":"添加出错"}', content_type='application/json')



class OrgHomeView(View):
    def get(self, request, org_id):
        msg = 'home'
        has_fav = False
        course_org = CourseOrg.objects.get(id=int(org_id))
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=int(course_org.id), fav_type=2):
                has_fav = True
        all_courses = course_org.coures_set.all()[:3]
        all_teacher = course_org.teacher_set.all()[:1 ]
        return render(request, "org-detail-homepage.html", locals())


class OrgCourseView(View):
    def get(self, request, org_id):
        msg = 'jgkc'
        has_fav = False
        course_org = CourseOrg.objects.get(id=int(org_id))
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=int(course_org.id), fav_type=2):
                has_fav = True
        all_courses = course_org.coures_set.all()
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



class OrgDescView(View):
    def get(self, request, org_id):
        msg = "desc"
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=int(course_org.id), fav_type=2):
                has_fav = True
        return render(request, "org-detail-desc.html", locals())



class OrgTeachersView(View):
    def get(self, request, org_id):
        msg = "teac"
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=int(course_org.id), fav_type=2):
                has_fav = True
        teachers_org = course_org.teacher_set.all()
        for name in teachers_org:
            kctj = Coures.objects.filter(kcjs_org=name)
            kctj2 = len(kctj)

        return render(request, "org-detail-teachers.html", locals())



class AddFavView(View):
    def post(self, request):
        fav_id = request.POST.get('fav_id', 0)
        fav_type = request.POST.get('fav_type', 0)

        if not request.user.is_authenticated():
            return HttpResponse('{"status":"fail", "msg":"用户未登录"}', content_type='application/json')

        exist_records = UserFavorite.objects.filter(user=request.user, fav_id=int(fav_id), fav_type=int(fav_type))
        if exist_records:
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


class TeachersListViews(View):
    def get(self, request):
        pd = "skjs"
        teachers_lists = Teacher.objects.all()
        teachers_shul = len(teachers_lists)
        sort = request.GET.get('sort', "")
        if sort:
            if sort == "hot":
                all_teachers = teachers_lists.order_by("-click_num")
        sorted_teacher = Teacher.objects.all().order_by("-click_num")[:10]
        search_key = request.GET.get("keywords", "")
        if search_key:
            teachers_lists = teachers_lists.filter(Q(name__icontains=search_key))
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


class TeacherDetailViews(View):
    def get(self, request, teacher_id):
        pd = "skjs"
        teacher_detail = Teacher.objects.get(id=int(teacher_id))
        teacher_detail.click_num += 1
        teacher_detail.save()
        all_courses = Coures.objects.filter(kcjs_org=teacher_detail)
        teacher_px = Teacher.objects.all().order_by("click_num")[:3]
        has_jg = False
        has_js = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=teacher_detail.id, fav_type=3):
                has_js = True

            if UserFavorite.objects.filter(user=request.user, fav_id=teacher_detail.org.id, fav_type=2):
                has_jg = True
        return render(request, "teacher-detail.html", locals())


