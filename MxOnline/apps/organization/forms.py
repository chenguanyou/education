from django import forms

import re #正则表达式
from operation.models import *


# from operation.models import *
# class Xinxi_Form(forms.Form):
#     name = forms.CharField(required=True, error_messages={"required": "信息不能为空"})
#     mobile = forms.CharField(required=True, error_messages={"required": "信息不能为空"})
#     course_name = forms.CharField(required=True, error_messages={"required": "信息不能为空"})

#使用ModelForm来做表单验证
class Xinxi_Form(forms.ModelForm):
    class Meta:
        model = UserAsk
        fields = ['name','mobile','course_name']

    # def clean_mobile(self):
    #     #验证手机号码
    #     mobile = self.changed_data["mobile"]
    #     REGEX_MOBILE = "^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$"
    #     p = re.compile(REGEX_MOBILE)
    #     if p.match(mobile):
    #         return mobile
    #     else:
    #         raise forms.ValidationError("手机号码非法", code="mobile_invalid")



