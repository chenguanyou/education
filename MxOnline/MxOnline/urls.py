"""MxOnline URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
from django.views.static import serve
from django.conf.urls.static import static
from django.views.generic import TemplateView
from django.views.static import serve

from MxOnline.settings import MEDIA_ROOT, MEDIA_URL, STATIC_ROOT#用于生产环境
import xadmin #导入xadmin工具包

urlpatterns = [
    #url(r'^admin/', admin.site.urls),
    url(r'^', include('users.urls'), name="users"), #用户登录注册相关urls
    url(r'^', include('organization.urls'), name="organization"), #授课机构urls
    url(r'^', include('courses.urls'), name="courses"), #公开课url
    url(r'^captcha/', include('captcha.urls')), #生成验证码
    url(r'^admin/', include(xadmin.site.urls)), #这里使用xadmin来管理后台，替换原有的admin
    url(r'^ueditor/', include('DjangoUeditor.urls')),  # 富文本url
    url(r'^Banner/(?P<path>.*)$', serve, { 'document_root':MEDIA_ROOT }), #配置在生产环境下的图片不能访问的问题
    url(r'^static/(?P<path>.*)$', serve, { 'document_root':STATIC_ROOT }), #配置在生产环境下的静态样式不能访问的问题
] #+ static(MEDIA_URL, document_root=MEDIA_ROOT) #图片的url连接


#全局404, 500, 403 url配置
handler404 = "users.views.page_not_found"
handler500 = "users.views.page_error"
handler403 = "users.views.page_403error"
