from django import forms

from operation.models import *


class Xinxi_Form(forms.ModelForm):
    class Meta:
        model = UserAsk
        fields = ['name','mobile','course_name']




