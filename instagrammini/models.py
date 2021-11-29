from django.db import models
from django.contrib.auth.models import User
import datetime
from time import time

from django.db.models.signals import post_save , pre_delete , pre_save , post_delete
from django.contrib.postgres.fields import ArrayField,HStoreField

# Create your models here.

def getImagePath(instance , filename):
    current_time = str(time()).replace('.', '_')
    toReturn = f'albums/images/{current_time}/{instance.topic}/{instance.id}/{filename}'
    return toReturn


class Topic(models.Model):
    created = models.DateTimeField(auto_now_add = True)
    updated = models.DateTimeField(auto_now=True)
    title = models.CharField(max_length = 1200,db_index = True,unique=True)
    
    
    
class HashTags(models.Model):
    created = models.DateTimeField(auto_now_add = True)
    updated = models.DateTimeField(auto_now=True)
    tag = models.CharField(max_length = 1200,db_index = True,unique=True)
    



class AlbumSubs(models.Model):
    displayPicture = models.ImageField(upload_to = getImagePath, null = True)
    created = models.DateTimeField(auto_now_add = True)
    updated = models.DateTimeField(auto_now=True)
    description = models.CharField(max_length = 1200,null=True,blank=True)
    positons = ArrayField(models.CharField(max_length=10), blank=True,null=True)
    
    
class Album(models.Model):
    created = models.DateTimeField(auto_now_add = True)
    topic = models.ManyToManyField(Topic,related_name="usersubscribedtopics")
    HashTags = models.ManyToManyField(Topic,related_name="useraddedhashtags")
    created_by = models.ForeignKey(User,on_delete=models.CASCADE,related_name="useralbums")
    updated = models.DateTimeField(auto_now=True)
    title = models.CharField(max_length = 900)
    is_published = models.BooleanField(default=False)
    is_draft = models.BooleanField(default=False)
    pics = models.ManyToManyField(AlbumSubs,related_name="mainalbum")
    
    