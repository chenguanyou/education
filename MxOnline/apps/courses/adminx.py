import xadmin

from .models import *
from organization.models import *

class LessonInlines(object):
    model = Lesson
    extra = 0

class CourseResourceInlines(object):
    model = CourseResource
    extra = 0
class VideoInlines(object):
    model = Video
    extra = 0

class CouresAdmin(object):
    list_display = ["name","degree","learn_times","students","fav_nums","click_nums","add_time","get_zj_nums","htmls"]
    search_fields = ["name","degree","learn_times","students","fav_nums","click_nums"]
    list_filter = ["name","degree","learn_times","students","fav_nums","click_nums","add_time"]
    list_editable = ["degree"]
    ordering = ["-click_nums"]
    exclude = ["students","fav_nums","click_nums","add_time"]
    model_icon = "fa fa-book"
    inlines = [LessonInlines, CourseResourceInlines]
    refresh_times = [5,8,10]
    style_fields = {"detail":"ueditor"}

    def queryset(self):
        qs = super(CouresAdmin,self).queryset()
        qs = qs.filter(is_tg=False)
        return qs


    def save_models(self):
        obj = self.new_obj
        obj.save()
        if obj.course_org is not None:
            course_org = obj.course_org
            course_org.kcs = Coures.objects.filter(course_org=course_org).count()
            course_org.save()


class BannerCouresAdmin(object):
    list_display = ["name","degree","learn_times","students","fav_nums","click_nums","add_time","get_zj_nums","htmls"]
    search_fields = ["name","degree","learn_times","students","fav_nums","click_nums"]
    list_filter = ["name","degree","learn_times","students","fav_nums","click_nums","add_time"]
    ordering = ["-click_nums"]
    exclude = ["students","fav_nums","click_nums","add_time"]
    model_icon = "fa fa-book"
    inlines = [LessonInlines, CourseResourceInlines]
    style_fields = {"detail": "ueditor"}

    def queryset(self):
        qs = super(BannerCouresAdmin, self).queryset()
        qs = qs.filter(is_tg=True)
        return qs



class LessonAdmin(object):
    list_display = ["course","name","add_time"]
    search_fields = ["course","name"]
    list_filter = ["course","name","add_time"]
    model_icon = "fa fa-bookmark"
    inlines = [VideoInlines]


class VideoAdmin(object):
    list_display = ["lesson","name","add_time"]
    search_fields = ["lesson","name"]
    list_filter = ["lesson","name","add_time"]
    model_icon = "fa fa-bolt"


class CourseResourceAdmin(object):
    list_display = ["course","name","download","add_time"]
    search_fields = ["course","name","download"]
    list_filter = ["course","name","download","add_time"]
    model_icon = "fa fa-cloud-upload"


xadmin.site.register(Coures, CouresAdmin)
xadmin.site.register(BannerCoures, BannerCouresAdmin)
xadmin.site.register(Lesson, LessonAdmin)
xadmin.site.register(Video, VideoAdmin)
xadmin.site.register(CourseResource, CourseResourceAdmin)