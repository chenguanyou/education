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

from MxOnline.settings import MEDIA_ROOT, MEDIA_URL, STATIC_ROOT
import xadmin

urlpatterns = [
    #url(r'^admin/', admin.site.urls),
    url(r'^', include('users.urls'), name="users"),
    url(r'^', include('organization.urls'), name="organization"),
    url(r'^', include('courses.urls'), name="courses"),
    url(r'^captcha/', include('captcha.urls')),
    url(r'^admin/', include(xadmin.site.urls)),
    url(r'^ueditor/', include('DjangoUeditor.urls')),
    url(r'^Banner/(?P<path>.*)$', serve, { 'document_root':MEDIA_ROOT }),
    url(r'^static/(?P<path>.*)$', serve, { 'document_root':STATIC_ROOT }),
]


handler404 = "users.views.page_not_found"
handler500 = "users.views.page_error"
handler403 = "users.views.page_403error"
