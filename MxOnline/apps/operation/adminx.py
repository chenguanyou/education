import xadmin

from .models import *

class UserAskAdmin(object):
    list_display = ["name","mobile","course_name","add_time"]
    search_fields = ["name","mobile","course_name"]
    list_filter = ["name","mobile","course_name","add_time"]
    model_icon = "fa fa-pencil-square-o"


class CourseCommentsAdmin(object):
    list_display = ["user","course","comments","add_time"]
    search_fields = ["user","course","comments"]
    list_filter =  ["user","course","comments","add_time"]
    model_icon = "fa fa-comments"


class UserFavoriteAdmin(object):
    list_display = ["user","fav_id","fav_type","add_tile"]
    search_fields = ["user","fav_id","fav_type"]
    list_filter = ["user","fav_id","fav_type","add_tile"]
    model_icon = "fa fa-heart"


class UserMessageAdmin(object):
    list_display = ["user","message","has_read","add_time"]
    search_fields = ["user","message","has_read"]
    list_filter = ["user","message","has_read","add_time"]
    model_icon = "fa fa-comment"

class UserCourseAdmin(object):
    list_display = ["user","course","add_time"]
    search_fields = ["user","course"]
    list_filter = ["user","course","add_time"]
    model_icon = "fa fa-book"


xadmin.site.register(UserAsk, UserAskAdmin)
xadmin.site.register(CourseComments, CourseCommentsAdmin)
xadmin.site.register(UserFavorite, UserFavoriteAdmin)
xadmin.site.register(UserMessage, UserMessageAdmin)
xadmin.site.register(UserCourse, UserCourseAdmin)