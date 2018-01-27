from django.db import models
from datetime import datetime

from django.contrib.auth.models import AbstractUser

# Create your models here.

'''用户表'''
class UserProFile(AbstractUser):
    nick_name = models.CharField(max_length=30, default="匿名用户", verbose_name="昵称")
    birday = models.DateField(null=True, blank=True, verbose_name="生日")
    address = models.CharField(max_length=200, verbose_name="地址")
    mobile = models.CharField(max_length=11, null=True, blank=True, verbose_name="手机")
    #emails = models.EmailField(null=False, blank=False, verbose_name="邮箱")
    is_jh = models.BooleanField(choices=(("1","激活"),("0","未激活")), default="1", verbose_name="是否激活")
    image = models.ImageField(upload_to="image/%Y/%m", default="image/default.png", null=True, blank=True, max_length=100, verbose_name="头像")
    gender = models.CharField(max_length=6, choices=(("male","男"),("female","女")), default="female", verbose_name="性别")

    class Meta:
        verbose_name = "用户信息"
        verbose_name_plural = verbose_name
        # db_table = "UserPaoFile"

    #获取用户未读消息的数量
    def get_message_num(self):
        from operation.models import UserMessage
        return UserMessage.objects.filter(user=self.id, has_read=False).count()

    def __str__(self):
        return self.username


'''邮箱验证码表'''
class EmailVerifyRecord(models.Model):
    code = models.CharField(max_length=20, verbose_name="验证码")
    email = models.EmailField(max_length=50, verbose_name="邮箱")
    is_sx = models.BooleanField(choices=(("1","可用"),("0","不可用")), default="1", verbose_name="激活是否可以")
    send_type = models.CharField(max_length=20, choices=(("register","用户注册"), ("forget","找回密码"), ("upload_email","修改密码")), default="register",verbose_name="验证码类型")
    send_time = models.DateTimeField(default=datetime.now, verbose_name="发送时间")

    class Meta:
        verbose_name = "邮箱验证码"
        verbose_name_plural = verbose_name
        db_table = "EmailVerifyRecord"

    def __str__(self):
        return self.email

'''轮播图'''
class Banner(models.Model):
    title = models.CharField(max_length=100, verbose_name="标题")
    image = models.ImageField(upload_to="Banner/%Y/%m", null=True, blank=True, verbose_name="轮播图")
    url = models.URLField(verbose_name="访问地址")
    index = models.IntegerField(default=100, verbose_name="展示顺序")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "轮播图"
        verbose_name_plural = verbose_name
        db_table = "Banner"

    def __str__(self):
        return self.title


