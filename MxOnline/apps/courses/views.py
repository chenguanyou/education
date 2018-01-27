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
        coures_list = Coures.objects.all().order_by("-add_time")#获取课程列表的最新数据
        #课程排序
        sort = request.GET.get("sort","")
        if sort:
            if sort == "hot":
                coures_list = coures_list.order_by("-click_nums")
            elif sort =="students":
                coures_list = coures_list.order_by("-students")
        coures_lists = Coures.objects.all().order_by("-fav_nums")[:2]
        #课程搜索功能
        search_key = request.GET.get("keywords", "")
        if search_key:
            coures_list =coures_list.filter(Q(name__icontains=search_key)|Q(desc__icontains=search_key)|Q(detail__icontains=search_key)) #不区分大小写搜索
        #课程的搜索功能
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

        # 判断是否收藏
        has_fav_course = False
        has_fav_org = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_cent.id, fav_type=1):
                has_fav_course = True
            if UserFavorite.objects.filter(user=request.user, fav_id=course_cent.course_org.id, fav_type=2):
                has_fav_org = True
                # 判断是否收藏

        #课程的点击数
        course_cent.click_nums += 1
        course_cent.save()
        #课程的标签推荐
        tag = course_cent.tag
        if tag:
            tag = Coures.objects.filter(tag__icontains=tag)[:1]
        else:
            tag = []
        return render(request, 'course-detail.html', locals())


#课程详情
class CourseVideoViews(LoginRequiredMIxin, View): #继承LoginRequiredMIxin，如果用户在没有登陆的情况下，跳转到登陆界面
    def get(self, request, course_id):
        pd = "gkk"
        coures_xinxi = Coures.objects.get(id=int(course_id))
        #关联用户和用户的学习过的课程
        user_courses = UserCourse.objects.filter(user=request.user, course=coures_xinxi)
        if not user_courses:
            user_course = UserCourse(user=request.user, course=coures_xinxi)
            user_course.save()
        #关联用户和用户的学习过的课程
        #学习过这个课程的用户还学习过别的课程功能
        user_coures =  UserCourse.objects.filter(course=coures_xinxi)
        user_ids = [user_courer.user.id for user_courer in user_coures]
        all_user_coures = UserCourse.objects.filter(user_id__in=user_ids) #user_id__in告诉他查询的是个列表
        coures_id = [user_courer.user.id for user_courer in all_user_coures]
        relate_courses = Coures.objects.filter(id__in=coures_id).order_by("-click_nums")[:5]
        #学习过这个课程的用户还学习过别的课程功能
        #print(relate_courses)
        return render(request, "course-video.html", locals())


#课程评论
class KeChengPinglViews(View):
    def get(self, request, course_id):
        pd = "gkk"
        coures_xinxi = Coures.objects.get(id=int(course_id))
        #学习过这个课程的用户还学习过别的课程功能
        user_coures =  UserCourse.objects.filter(course=coures_xinxi)
        user_ids = [user_courer.user.id for user_courer in user_coures]
        all_user_coures = UserCourse.objects.filter(user_id__in=user_ids) #user_id__in告诉他查询的是个列表
        coures_id = [user_courer.user.id for user_courer in user_coures]
        relate_courses = Coures.objects.filter(id__in=course_id).order_by("-click_nums")[:5]
        #学习过这个课程的用户还学习过别的课程功能
        return render(request, "course-comment.html", locals())


#添加课程评论
class AddComentsViews(View):
    def post(self, request):
        if not request.user.is_authenticated():
            #判断用户登录状态
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
        #return render(request, "course-comment.html", locals())