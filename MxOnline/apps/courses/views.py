from django.shortcuts import render
from django.views import View
from django.http import HttpResponse
from django.db.models import Q
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger

from .models import *
from operation.models import *
from utils.mixin_utils import LoginRequiredMIxin
# Create your views here.

class CoursesView(View):
    def get(self, request):
        pd = "gkk"
        coures_list = Coures.objects.all().order_by("-add_time")
        sort = request.GET.get("sort","")
        if sort:
            if sort == "hot":
                coures_list = coures_list.order_by("-click_nums")
            elif sort =="students":
                coures_list = coures_list.order_by("-students")
        coures_lists = Coures.objects.all().order_by("-fav_nums")[:2]
        search_key = request.GET.get("keywords", "")
        if search_key:
            coures_list =coures_list.filter(Q(name__icontains=search_key)|Q(desc__icontains=search_key)|Q(detail__icontains=search_key))
        try:
            page = request.GET.get('page', 1)
            p = Paginator(coures_list, 6, request=request)
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
        return render(request, 'course-list.html', locals())


class CourseDetail(View):
    def get(self, request, course_id):
        pd = "gkk"
        course_cent = Coures.objects.get(id=int(course_id))
        has_fav_course = False
        has_fav_org = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_cent.id, fav_type=1):
                has_fav_course = True
            if UserFavorite.objects.filter(user=request.user, fav_id=course_cent.course_org.id, fav_type=2):
                has_fav_org = True
        course_cent.click_nums += 1
        course_cent.save()
        tag = course_cent.tag
        if tag:
            tag = Coures.objects.filter(tag__icontains=tag)[:1]
        else:
            tag = []
        return render(request, 'course-detail.html', locals())



class CourseVideoViews(LoginRequiredMIxin, View):
    def get(self, request, course_id):
        pd = "gkk"
        coures_xinxi = Coures.objects.get(id=int(course_id))
        user_courses = UserCourse.objects.filter(user=request.user, course=coures_xinxi)
        if not user_courses:
            user_course = UserCourse(user=request.user, course=coures_xinxi)
            user_course.save()
        user_coures =  UserCourse.objects.filter(course=coures_xinxi)
        user_ids = [user_courer.user.id for user_courer in user_coures]
        all_user_coures = UserCourse.objects.filter(user_id__in=user_ids)
        coures_id = [user_courer.user.id for user_courer in all_user_coures]
        relate_courses = Coures.objects.filter(id__in=coures_id).order_by("-click_nums")[:5]
        return render(request, "course-video.html", locals())



class KeChengPinglViews(View):
    def get(self, request, course_id):
        pd = "gkk"
        coures_xinxi = Coures.objects.get(id=int(course_id))
        user_coures =  UserCourse.objects.filter(course=coures_xinxi)
        user_ids = [user_courer.user.id for user_courer in user_coures]
        all_user_coures = UserCourse.objects.filter(user_id__in=user_ids)
        coures_id = [user_courer.user.id for user_courer in user_coures]
        relate_courses = Coures.objects.filter(id__in=course_id).order_by("-click_nums")[:5]
        return render(request, "course-comment.html", locals())



class AddComentsViews(View):
    def post(self, request):
        if not request.user.is_authenticated():
            return HttpResponse('{"status":"fail", "msg":"用户未登录"}', content_type='application/json')

        course_id = request.POST.get("course_id", 0)
        comments = request.POST.get("comments", "")
        if int(course_id) > 0 and comments:
            course_comments = CourseComments()
            course = Coures.objects.get(id=course_id)
            course_comments.user = request.user
            course_comments.course = course
            course_comments.comments = comments
            course_comments.save()
            return HttpResponse('{"status":"success", "msg":"评论成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail", "msg":"评论出错"}', content_type='application/json')