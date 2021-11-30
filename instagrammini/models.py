from django.db import models
from django.contrib.auth.models import User
import datetime
from time import time

from django.db.models.signals import post_save , pre_delete , pre_save , post_delete
from django.contrib.postgres.fields import ArrayField,HStoreField

# Create your models here.
colors = (
    ('Red','Red'),
    ('Yellow','Yellow'),
    ('Pink','Pink'),
    ('Grey','Grey'),
    ('Peach', 'Peach'),
    ('Black', 'Black'),
    ('White', 'White'),
)


album_status = (
    ('Draft','Draft'),
    ('Published','Published'),
    ('NotPublished','NotPublished'),
)

def getImagePath(instance , filename):
    current_time = str(time()).replace('.', '_')
    toReturn = f'albums/images/{current_time}/{instance.topic}/{instance.id}/{filename}'
    return toReturn


class Topic(models.Model):
    created = models.DateTimeField(auto_now_add = True)
    updated = models.DateTimeField(auto_now=True)
    title = models.CharField(max_length = 1200,db_index = True,unique=True)
    
    
    
class Album(models.Model):
    created = models.DateTimeField(auto_now_add = True)
    topics = models.ManyToManyField(Topic,related_name="usersubscribedtopics")
    HashTags = ArrayField(models.CharField(max_length=10), blank=True,null=True)
    created_by = models.ForeignKey(User,on_delete=models.CASCADE,related_name="useralbums")
    updated = models.DateTimeField(auto_now=True)
    title = models.CharField(max_length = 900)
    status = models.CharField(max_length = 900,choices=colors,default="White")
    

class AlbumSubs(models.Model):
    image = models.ImageField(upload_to = getImagePath)
    created = models.DateTimeField(auto_now_add = True)
    updated = models.DateTimeField(auto_now=True)
    file_name = models.CharField(max_length=1200,null=True,blank=True)
    file_size = models.CharField(max_length=60,null=True,blank=True) # in MB
    caption = models.CharField(max_length = 1200,null=True,blank=True)
    background_color = models.CharField(max_length = 900,choices=colors,default="White")
    album = models.ForeignKey(Album,on_delete=models.CASCADE,related_name="albumsubs")
    font_color = models.CharField(max_length = 900,choices=colors,default="Black")
    positons = ArrayField(models.CharField(max_length=10), blank=True,null=True)
    
    @property
    def imageUrl(self):
        try:
            url = self.displayPicture.url
        except:
            url = None
        return url
class SimilarUserSearch(models.Model):
    created = models.DateTimeField(auto_now_add = True)
    updated = models.DateTimeField(auto_now=True)
    user = models.ForeignKey(User,on_delete=models.CASCADE,related_name="similarusers")
    matching_user = models.ForeignKey(User,on_delete=models.CASCADE,related_name="usersimilars",null=True)
    similarty_score = models.PositiveIntegerField(default=0)

    
    