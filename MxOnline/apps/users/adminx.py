import xadmin
from xadmin import views #引入xadmin的主题视图来支持主题选择

from .models import *


#让xadmin后台支持主题选择
class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


#修改xadmin的头部和底部信息
class GlobalSetting(object):
    site_title = "小白后台管理系统"
    site_footer = "小白学习网"
    menu_style = "accordion" #把App收缩起来


class EmailVerifyRecordAdmin(object):
    list_display = ["code","email","send_type","send_time"] #后台显示类型
    search_fields = ["code","email","send_type"] #设置搜索
    list_filter = ["code","email","send_type","send_time"] #搜索过滤器
    model_icon = "fa fa-envelope" #这样可以替换与设置原有的Xadmin的图标


class BannerAdmin(object):
    list_display = ["index","title","add_time","url"] #后台显示类型
    search_fields = ["index","title","url"] #设置搜索
    list_filter = ["index","title","add_time","url"] #搜索过滤器
    model_icon = "fa fa-picture-o" #设置一个图标


xadmin.site.register(EmailVerifyRecord, EmailVerifyRecordAdmin)
xadmin.site.register(Banner, BannerAdmin)
xadmin.site.register(views.BaseAdminView, BaseSetting) #注册xadmin的主题视图来支持主题选择
xadmin.site.register(views.CommAdminView, GlobalSetting) #注册修改xadmin后台的页头和底部信息