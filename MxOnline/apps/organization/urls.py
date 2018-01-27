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


from .views import *

urlpatterns = [
    url(r'^org_list/$',Org_listView.as_view(), name="Org_listView"),
    url(r'^addxinxi/$',Add_xinxi.as_view(), name="addxinxi"),
    url(r'^home/(?P<org_id>\d+)/$',OrgHomeView.as_view(), name="orghome"),
    url(r'^course/(?P<org_id>\d+)/$',OrgCourseView.as_view(), name="course"), #机构首页
    url(r'^desc/(?P<org_id>\d+)/$', OrgDescView.as_view(), name="desc"),
    url(r'^teac/(?P<org_id>\d+)/$', OrgTeachersView.as_view(), name="teac"),
    url(r'^add_fav/$', AddFavView.as_view(), name="add_fav"), #添加收藏
    url(r'^teachers-list/$', TeachersListViews.as_view(), name="teachers-list"), #讲师列表
    url(r'^teachers-detail/(?P<teacher_id>\d+)/$', TeacherDetailViews.as_view(), name="teachers-detail"), #讲师详情

]
