import xadmin

from .models import *
from organization.models import *

#实现在课程里面添加章节和课程附件
class LessonInlines(object):
    model = Lesson
    extra = 0

class CourseResourceInlines(object):
    model = CourseResource
    extra = 0
class VideoInlines(object):
    model = Video
    extra = 0

#对普通课程的显示注册
class CouresAdmin(object):
    list_display = ["name","degree","learn_times","students","fav_nums","click_nums","add_time","get_zj_nums","htmls"]
    search_fields = ["name","degree","learn_times","students","fav_nums","click_nums"]
    list_filter = ["name","degree","learn_times","students","fav_nums","click_nums","add_time"]
    list_editable = ["degree"] #直接在数据的列表页面来修改指定的数据
    ordering = ["-click_nums"] #按照点击人数最多的进行排序
    #readonly_fields = ["students","fav_nums","click_nums","add_time"] #让部分表单添加时间，学习人数，等不能再Xadmin表单里面编辑
    exclude = ["students","fav_nums","click_nums","add_time"] #设置隐藏不需要编辑的表单，这个和上面的冲突，两者只能存在一者
    model_icon = "fa fa-book"
    inlines = [LessonInlines, CourseResourceInlines] #实现在课程详情里面加入课程章节，课程资源
    refresh_times = [5,8,10] #每隔几秒刷新一次当前页面
    style_fields = {"detail":"ueditor"} #使用富文本编辑器

    def queryset(self):  # 使用queryset的方法来获取父类里面的推广的课程，这样就实现了对轮播图课程的显示，也可以在这里面加入别的自己的逻辑
        qs = super(CouresAdmin,self).queryset()
        qs = qs.filter(is_tg=False)
        return qs


    def save_models(self): #每次修改和删除课程的时候做一个统计章节数的功能
        obj = self.new_obj
        obj.save()
        if obj.course_org is not None:
            course_org = obj.course_org
            course_org.kcs = Coures.objects.filter(course_org=course_org).count()
            course_org.save()


#首页轮播图课程的注册
class BannerCouresAdmin(object):
    list_display = ["name","degree","learn_times","students","fav_nums","click_nums","add_time","get_zj_nums","htmls"]
    search_fields = ["name","degree","learn_times","students","fav_nums","click_nums"]
    list_filter = ["name","degree","learn_times","students","fav_nums","click_nums","add_time"]
    ordering = ["-click_nums"] #按照点击人数最多的进行排序
    #readonly_fields = ["students","fav_nums","click_nums","add_time"] #让部分表单添加时间，学习人数，等不能再Xadmin表单里面编辑
    exclude = ["students","fav_nums","click_nums","add_time"] #设置隐藏不需要编辑的表单，这个和上面的冲突，两者只能存在一者
    model_icon = "fa fa-book"
    inlines = [LessonInlines, CourseResourceInlines] #实现在课程详情里面加入课程章节，课程资源
    style_fields = {"detail": "ueditor"} #使用富文本编辑器

    def queryset(self): #使用queryset的方法来获取父类里面的推广的课程，这样就实现了对轮播图课程的显示，也可以在这里面加入别的自己的逻辑
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