# -*- coding: utf-8 -*-
# Generated by Django 1.11.7 on 2018-01-01 21:36
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0007_coures_tag'),
    ]

    operations = [
        migrations.AlterField(
            model_name='coures',
            name='tag',
            field=models.CharField(blank=True, default='Python开发', max_length=20, null=True, verbose_name='课程标签'),
        ),
    ]