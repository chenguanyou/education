# -*- coding: utf-8 -*-
# Generated by Django 1.11.7 on 2017-12-29 12:06
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0008_auto_20171229_1144'),
    ]

    operations = [
        migrations.AddField(
            model_name='emailverifyrecord',
            name='is_sx',
            field=models.IntegerField(choices=[('1', '可用'), ('0', '不可用')], default='1', verbose_name='激活是否可以'),
        ),
    ]
