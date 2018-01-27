from datetime import datetime

from django.db import models

from users.models import UserProFile
from  courses.models import Coures


# Create your models here.


'''用户报名表'''
class UserAsk(models.Model):
    name = models.CharField(max_length=20, verbose_name="姓名")
    mobile = models.CharField(max_length=11, verbose_name="手机")
    course_name = models.CharField(max_length=50, verbose_name="课程名称")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="报名时间")

    class Meta:
        verbose_name = "用户报名"
        verbose_name_plural = verbose_name
        db_table = "UserAsk"

    def __str__(self):
        return self.name


'''课程评论'''
class CourseComments(models.Model):
    user = models.ForeignKey(UserProFile, verbose_name="用户")
    course = models.ForeignKey(Coures, verbose_name="课程")
    comments = models.CharField(max_length=300, verbose_name="评论")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="评论时间")

    class Meta:
        verbose_name = "用户评论"
        verbose_name_plural = verbose_name
        db_table = "CourseComments"

    def __str__(self):
        return self.comments



'''用户收藏'''
class UserFavorite(models.Model):
    user = models.ForeignKey(UserProFile, verbose_name="用户")
    fav_id = models.IntegerField(default=0, verbose_name="数据id")
    fav_type = models.IntegerField(choices=((1,"课程"),(2,"课程机构"),(3,"讲师")), default=1, verbose_name="收藏类型")
    add_tile = models.DateTimeField(default=datetime.now, verbose_name="收藏时间")

    class Meta:
        verbose_name = "用户收藏"
        verbose_name_plural = verbose_name
        db_table = "UserFavorite"

    # def __str__(self):
    #     return self.user


'''用户消息模型'''
class UserMessage(models.Model):
    user = models.IntegerField(default=0 , verbose_name="接收用户")
    message = models.CharField(max_length=500, verbose_name="消息内容")
    has_read = models.BooleanField(default=False, verbose_name="是否已读")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="消息时间")

    class Meta:
        verbose_name = "用户消息"
        verbose_name_plural = verbose_name
        db_table = "UserMessage"

    # def __str__(self):
    #     return self.user


'''用户课程模型'''
class UserCourse(models.Model):
    user = models.ForeignKey(UserProFile, verbose_name="用户")
    course = models.ForeignKey(Coures, verbose_name="课程")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "用户课程"
        verbose_name_plural = verbose_name
        db_table = "UserCourse"

    # def __str__(self):
    #     return self.add_time





