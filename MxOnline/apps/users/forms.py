from django import forms
from captcha.fields import CaptchaField #验证码

from users.models import UserProFile


#用户登陆
class Login_Form(forms.Form):
    username = forms.CharField(required=True, error_messages={"required":"账号不能为空"})
    password = forms.CharField(required=True, min_length=5,error_messages={"required": "密码不能为空",})


#用户账号注册
class RegisterForm(forms.Form):
    email = forms.EmailField(required=True, error_messages={"required":"邮箱不能为空"})
    password = forms.CharField(required=True, min_length=6, max_length=16, error_messages={"required":"密码不能为空"})
    captcha = CaptchaField(error_messages={"invalid":"验证码错误", "required":"验证码不能为空"}) #生成验证码

#用户找回密码
class ForgetPwdForm(forms.Form):
    email = forms.EmailField(required=True, error_messages={"required":"邮箱不能为空"})
    captcha = CaptchaField(error_messages={"invalid":"验证码错误", "required":"验证码不能为空"}) #生成验证码

#密码修改
class MoforPwdForm(forms.Form):
    password1 = forms.CharField(required=True, error_messages={"required": "密码不能为空"})
    password2 = forms.CharField(required=True, error_messages={"required": "密码不能为空"})

#用来修改用户中心的头像
class UploadImageForm(forms.ModelForm):
    class Meta:
        model = UserProFile
        fields = ['image']

#用来修改用户中心的信息
class UploadinfoForm(forms.ModelForm):
    class Meta:
        model = UserProFile
        fields = ['nick_name','birday','gender','address','mobile']
