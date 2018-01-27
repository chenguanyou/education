from django.conf.urls import url

from .views import *

urlpatterns = [
    url(r'^courses/$', CoursesView.as_view(), name="courses"),
    url(r'^course_detail/(?P<course_id>\d+)/$', CourseDetail.as_view(), name="course_detail"),
    url(r'^course_video/(?P<course_id>\d+)$',CourseVideoViews.as_view(), name="course_video"),
    url(r'^comment/(?P<course_id>\d+)$', KeChengPinglViews.as_view(), name="comment"),
    url(r'^add_comment/$', AddComentsViews.as_view(), name="add_comment"),
]