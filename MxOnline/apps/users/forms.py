from django import forms
from captcha.fields import CaptchaField

from users.models import UserProFile



class Login_Form(forms.Form):
    username = forms.CharField(required=True, error_messages={"required":"账号不能为空"})
    password = forms.CharField(required=True, min_length=5,error_messages={"required": "密码不能为空",})



class RegisterForm(forms.Form):
    email = forms.EmailField(required=True, error_messages={"required":"邮箱不能为空"})
    password = forms.CharField(required=True, min_length=6, max_length=16, error_messages={"required":"密码不能为空"})
    captcha = CaptchaField(error_messages={"invalid":"验证码错误", "required":"验证码不能为空"})


class ForgetPwdForm(forms.Form):
    email = forms.EmailField(required=True, error_messages={"required":"邮箱不能为空"})
    captcha = CaptchaField(error_messages={"invalid":"验证码错误", "required":"验证码不能为空"})


class MoforPwdForm(forms.Form):
    password1 = forms.CharField(required=True, error_messages={"required": "密码不能为空"})
    password2 = forms.CharField(required=True, error_messages={"required": "密码不能为空"})


class UploadImageForm(forms.ModelForm):
    class Meta:
        model = UserProFile
        fields = ['image']


class UploadinfoForm(forms.ModelForm):
    class Meta:
        model = UserProFile
        fields = ['nick_name','birday','gender','address','mobile']
