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


urlpatterns = [
    #url(r'^indexx/$', index, name="index"),
    url(r'^login/$', LoginView.as_view(), name="login"),
    url(r'^register/$',RegisterView.as_view(), name="register"),
    url(r'^active/(?P<active_code>.*)/$',AciveUserView.as_view(), name="active"),
    url(r'^forget/$',ForgetPwdView.as_view(), name="forget"),
    url(r'^reset/(?P<active_code>.*)/$',ResetView.as_view(), name="reset"),
    url(r'^modisp_pwd/$', ModifiPwdView.as_view(), name="modisp_pwd"),
    url(r'^usercenter_info/$', UserInfoView.as_view(), name="usercenter_info"),
    url(r'^image/upload/$', UploadImageView.as_view(), name="image_upload"),
    url(r'^uploadpwd/$', UpLoadPwdView.as_view(), name="uploadpwd"),
    url(r'sendemail/$', SenderEmailCodeView.as_view(), name="senderemail"),
    url(r'yznzheng_email/$', YanZhengEmailView.as_view(), name="yanzheng_email"),
    url(r'^userinfo/$', UserInfoView.as_view(), name="userinfo"),
    url(r'^mycourse/$', MycourseView.as_view(), name="mycourse"),
    url(r'^favcourse/$', MyFavCourseView.as_view(), name="favcourse"),
    url(r'^myfavorg/$', MyFavOrgView.as_view(), name="myfavorg"),
    url(r'^myfavteacher/$',MyFavTeacherView.as_view(), name="myteacherfav"),
    url(r'^rem_fav/$',RemUserCenterView.as_view(), name="remfav"),
    url(r'^user_message/$', UserMessageView.as_view(), name="user_message"),
    url(r'^$', IndexView.as_view(), name="index"),
    url(r'^logout/$', LogOutView.as_view(), name="logout")
]
