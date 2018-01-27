from datetime import datetime


from django.db import models

# Create your models here.


'''城市的数据模型'''
class CityDict(models.Model):
    name = models.CharField(max_length=20, verbose_name="城市名称")
    desc = models.CharField(max_length=255, verbose_name="描述信息")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "城市地址"
        verbose_name_plural = verbose_name
        db_table = "CityDict"

    def __str__(self):
        return self.name


'''机构信息模型'''
class CourseOrg(models.Model):
    name = models.CharField(max_length=50, verbose_name="机构名称")
    desc = models.TextField(verbose_name="机构描述信息")
    catgory = models.CharField(max_length=50, choices=(("pxjg","培训机构"),("gx","高校"),("gr","个人")), default="pxjg", verbose_name="机构类别")
    click_nums = models.IntegerField(default=0, verbose_name="点击数")
    fav_nums = models.IntegerField(default=0, verbose_name="收藏数")
    org_tag = models.CharField(max_length=4, default="全国知名", verbose_name="机构类型")
    image = models.ImageField(upload_to="org/%Y/%m", null=True, blank=True, verbose_name="机构封面图")
    address = models.CharField(max_length=100, verbose_name="机构地址")
    city = models.ForeignKey(CityDict, verbose_name="所在城市")
    kcs = models.IntegerField(default=0, verbose_name="课程数")
    xxrs = models.IntegerField(default=0, verbose_name="学习人数")
    lxfs = models.CharField(max_length=20, default="010-00000000", verbose_name="联系电话")

    class Meta:
        verbose_name = "课程机构"
        verbose_name_plural = verbose_name
        db_table = "CourseOrg"

    #获取老师的数量
    def get_ls_sl(self):
        return self.teacher_set.all().count()


    def __str__(self):
        return self.name


'''教师详情'''
class Teacher(models.Model):
    org = models.ForeignKey(CourseOrg, verbose_name="所属机构")
    name = models.CharField(max_length=10, verbose_name="教师名称")
    work_years = models.IntegerField(default=0, verbose_name="工作年限")
    work_comfany = models.CharField(max_length=50, verbose_name="就职公司")
    work_position = models.CharField(max_length=60, verbose_name="公司职业")
    points = models.CharField(max_length=30, verbose_name="教学特点")
    click_num = models.IntegerField(default=0, verbose_name="点击数")
    fav_num = models.IntegerField(default=0, verbose_name="收藏数")
    teacher_arg = models.IntegerField(default=20, verbose_name="讲师年龄")
    teacher_td = models.CharField(max_length=50, null=True, blank=True, verbose_name="教学特点")
    image = models.ImageField(upload_to="js/%Y/%m", null=True, blank=True, verbose_name="教师图片")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    class Meta:
        verbose_name = "教师信息"
        verbose_name_plural = verbose_name
        db_table = "Teacher"

    def get_kecheng_shuliang(self):
        return self.coures_set.all().count()

    def __str__(self):
        return self.name









