"""
Django settings for MxOnline project.

Generated by 'django-admin startproject' using Django 1.11.7.

For more information on this file, see
https://docs.djangoproject.com/en/1.11/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.11/ref/settings/
"""

import os
import sys  #导入系统的sys

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

#把apps插入到项目的第0个搜索位置，这样避免运行出错
sys.path.insert(0,os.path.join(BASE_DIR,'apps'))

#设置后台xadmin的路径
sys.path.insert(1,os.path.join(BASE_DIR,'extra_apps'))

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.11/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'kk77u)7494(*b@=zs6f*pc87j!mz+98yvujk)42%&1knw+*32r'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False

ALLOWED_HOSTS = ['*']


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    #App项目应用
    'users',
    'organization',
    'courses',
    'operation',
    #xAdmin替换默认的admin
    'xadmin',
    'crispy_forms',
    #Django的验证码
    'captcha',
    #Django的分页器
    'pure_pagination',
    #DjangoUeditor富文本编辑器
    'DjangoUeditor',
]

AUTH_USER_MODEL = 'users.UserProfile'

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'MxOnline.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR,'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

'''覆盖django自带的user必须要的，我也不知道为什么'''
WSGI_APPLICATION = 'MxOnline.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.11/ref/settings/#databases

# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.sqlite3',
#         'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
#     }
# }

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'mxonline',
        'USER': 'root',
        'PASSWORD': 'admin123456',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}

# Password validation
# https://docs.djangoproject.com/en/1.11/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/1.11/topics/i18n/

# LANGUAGE_CODE = 'en-us'

LANGUAGE_CODE = 'zh-hans' #语言改为中文

# TIME_ZONE = 'UTC'

TIME_ZONE = 'Asia/Shanghai' #时间改为中国上海

USE_I18N = True

USE_L10N = True

# USE_TZ = True
USE_TZ = False #改为False,让django使用本地时间

#格式化后台内容的显示时间
USE_L10N = False
DATETIME_FORMAT = 'Y-m-d H:i:s'
DATE_FORMAT = 'Y-m-d'

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.11/howto/static-files/

STATIC_URL = '/static/'

STATICFILES_DIRS = [
    (os.path.join(BASE_DIR, 'static')),
]

MEDIA_ROOT = os.path.join(BASE_DIR,'Banner')
MEDIA_URL = '/Banner/'
STATIC_ROOT = os.path.join(BASE_DIR, 'static') #用于生产环境

#定义邮箱账号密码
EMAIL_HOST = "smtp.sina.com"
EMAIL_PORT = 25
EMAIL_HOST_USER = "1234567890@sina.com"
EMAIL_HOST_PASSWORD = "1234567890"
EMAIL_USE_TLS= False
EMAIL_FROM = "1234567890@sina.com"

#分页功能的设置使用默认
# PAGINATION_SETTINGS = {
#     'PAGE_RANGE_DISPLAYED': 10,
#     'MARGIN_PAGES_DISPLAYED': 2,
#
#     'SHOW_FIRST_PAGE_WHEN_INVALID': True,
# }

