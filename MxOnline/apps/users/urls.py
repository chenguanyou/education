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
from django.conf.urls import url
from .views import *

import xadmin #导入xadmin工具包

urlpatterns = [
    #url(r'^indexx/$', index, name="index"),
    url(r'^login/$', LoginView.as_view(), name="login"),
    url(r'^register/$',RegisterView.as_view(), name="register"),
    url(r'^active/(?P<active_code>.*)/$',AciveUserView.as_view(), name="active"),
    url(r'^forget/$',ForgetPwdView.as_view(), name="forget"),
    url(r'^reset/(?P<active_code>.*)/$',ResetView.as_view(), name="reset"),
    url(r'^modisp_pwd/$', ModifiPwdView.as_view(), name="modisp_pwd"),
    url(r'^usercenter_info/$', UserInfoView.as_view(), name="usercenter_info"), #用户中心个人信息
    url(r'^image/upload/$', UploadImageView.as_view(), name="image_upload"), #用户个人中心上传头像
    url(r'^uploadpwd/$', UpLoadPwdView.as_view(), name="uploadpwd"), #用户个人中心修改密码
    url(r'sendemail/$', SenderEmailCodeView.as_view(), name="senderemail"), #像用户的邮箱内发送验证码用于个人中心的邮箱修改
    url(r'yznzheng_email/$', YanZhengEmailView.as_view(), name="yanzheng_email"), #用来验证用户中心修改的邮箱和验证码是否匹配
    url(r'^userinfo/$', UserInfoView.as_view(), name="userinfo"), #用来修改用户中心的其余信息
    url(r'^mycourse/$', MycourseView.as_view(), name="mycourse"), #用来显示用户中心的我的课程
    url(r'^favcourse/$', MyFavCourseView.as_view(), name="favcourse"), #用来显示用户中心的课程收藏
    url(r'^myfavorg/$', MyFavOrgView.as_view(), name="myfavorg"), #用来显示用户中心收藏的机构信息
    url(r'^myfavteacher/$',MyFavTeacherView.as_view(), name="myteacherfav"), #用来显示用户中心个人收藏的教师
    url(r'^rem_fav/$',RemUserCenterView.as_view(), name="remfav"), #用来删除教师的收藏
    url(r'^user_message/$', UserMessageView.as_view(), name="user_message"), #用来展示用户中心的用户消息
    url(r'^$', IndexView.as_view(), name="index"), #用来显示首页的url请求
    url(r'^logout/$', LogOutView.as_view(), name="logout") #用户的登陆退出请求
]
