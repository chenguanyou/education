from datetime import datetime

from DjangoUeditor.models import UEditorField

from django.db import models
from organization.models import CourseOrg, Teacher

# Create your models here.


'''课程详情的模型'''
class Coures(models.Model):
    course_org = models.ForeignKey(CourseOrg, null=True, blank=True, verbose_name="课程机构")
    name = models.CharField(max_length=50, verbose_name="课程名称")
    desc = models.CharField(max_length=300, verbose_name="课程描述")
    # detail = models.TextField(verbose_name="课程详情")
    detail = UEditorField(default='', width=600, height=300, toolbars="full", imagePath="course/image/%(basename)s_%(datetime)s.%(extname)s",
                          filePath="courses/file/%(basename)s_%(datetime)s.%(extname)s", settings={}, command=None, blank=True, verbose_name="课程详情")
    is_tg = models.BooleanField(default=False, verbose_name="课程首页推广")
    degree = models.CharField(choices=(("cj","初级"),("zj","中级"),("gj","高级")), default="zj", max_length=5, verbose_name="视频级别")
    learn_times = models.IntegerField(default=0, verbose_name="学习时长")
    students = models.IntegerField(default=0, verbose_name="学习人数")
    fav_nums = models.IntegerField(default=0, verbose_name="收藏人数")
    kcjs_org = models.ForeignKey(Teacher, null=True, blank=True, verbose_name="课程讲师")
    category = models.CharField(max_length=50, null=True, blank=True, verbose_name="课程类别")
    image = models.ImageField(upload_to="courses/%Y/%m", null=True, blank=True, verbose_name="封面图片")
    click_nums = models.IntegerField(default=0, verbose_name="点击人数")
    tag = models.CharField(default="Python开发", max_length=20, null=True, blank=True, verbose_name="课程标签")
    kcxz = models.CharField(max_length=50, null=True, blank=True, verbose_name="课程须知")
    xdaoshenm = models.CharField(max_length=100, null=True, blank=True, verbose_name="能学到什么？")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "课程详情"
        verbose_name_plural = verbose_name
        db_table = "Coures"

    #获取课程章节数
    def get_zj_nums(self):
        return self.lesson_set.all().count()
    get_zj_nums.short_description = "章节数" #定义这个函数在后台管理里面显示的名字

    #在后台里面加入html
    def htmls(self):
        from django.utils.safestring import mark_safe
        return mark_safe("<a href=\"http://www.baidu.com\">跳转一下</a>")
    htmls.short_description = "显示的html"

    #获取学习人数
    def get_learn_users(self):
        return self.usercourse_set.all()[:5]

    #获取课程的章节
    def get_zj(self):
        return self.lesson_set.all()

    #获取课程附件
    def get_kcfj(self):
        return self.courseresource_set.all()

    #获取当前课程的评论
    def get_pl(self):
        return self.coursecomments_set.all()

    def __str__(self):
        return self.name

'''获取首页轮播图的课程'''
class BannerCoures(Coures):

    class Meta:
        verbose_name = "轮播课程"
        verbose_name_plural = verbose_name
        proxy = True #这里非常关键如果不设置会新建一个表


'''课程章节数据模型'''
class Lesson(models.Model):
    course = models.ForeignKey(Coures, verbose_name="课程名称")
    name = models.CharField(max_length=120, verbose_name="章节名称")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "课程章节"
        verbose_name_plural = verbose_name
        db_table = "Lesson"

    #获取视频数据
    def get_spzy(self):
        return self.video_set.all()

    def __str__(self):
        return self.name


'''视频模型'''
class Video(models.Model):
    lesson = models.ForeignKey(Lesson, verbose_name="章节名称")
    name = models.CharField(max_length=120, verbose_name="视频名称")
    video_url = models.URLField(null=True, blank=True, verbose_name="视频资源地址")
    video_time = models.IntegerField(null=True, blank=True, verbose_name="视频时长")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="更新时间")

    class Meta:
        verbose_name = "视频资源"
        verbose_name_plural = verbose_name
        db_table = "Video"

    def __str__(self):
        return self.name

'''视频附件下载表模型'''
class CourseResource(models.Model):
    course = models.ForeignKey(Coures, verbose_name="课程名称")
    name = models.CharField(max_length=50, verbose_name="附件名称")
    download = models.FileField(upload_to="course/resource/%Y/%m", verbose_name="资源文件", max_length=150)
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "课程附件"
        verbose_name_plural = verbose_name
        db_table = "CourseResource"

    def __str__(self):
        return  self.name






