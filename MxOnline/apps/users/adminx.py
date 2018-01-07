import xadmin
from xadmin import views

from .models import *



class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


class GlobalSetting(object):
    site_title = "小白后台管理系统"
    site_footer = "小白学习网"
    menu_style = "accordion"


class EmailVerifyRecordAdmin(object):
    list_display = ["code","email","send_type","send_time"]
    search_fields = ["code","email","send_type"]
    list_filter = ["code","email","send_type","send_time"]
    model_icon = "fa fa-envelope"


class BannerAdmin(object):
    list_display = ["index","title","add_time","url"]
    search_fields = ["index","title","url"]
    list_filter = ["index","title","add_time","url"]
    model_icon = "fa fa-picture-o"


xadmin.site.register(EmailVerifyRecord, EmailVerifyRecordAdmin)
xadmin.site.register(Banner, BannerAdmin)
xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, GlobalSetting)