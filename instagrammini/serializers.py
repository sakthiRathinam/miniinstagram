from django.contrib.auth.models import User , Group
from django.contrib.auth import authenticate
from rest_framework import serializers
from rest_framework.exceptions import *
from .models import *
from typing import List
import datetime
from .service import get_timebefore,get_timeleft


class TopicSerializer(serializers.ModelSerializer):
    class Meta:
        model = Topic
        fields = '__all__'

class AlbumSubsSerializer(serializers.ModelSerializer):
    class Meta:
        model = AlbumSubs
        fields = '__all__'
    def create(self, validated_data):
        albumsub_obj = AlbumSubs(**validated_data)
        data = self.context['request'].data
        if 'album' in data:
            albumsub_obj.album = Album.objects.get(id=int(data['album']))
        albumsub_obj.file_name = albumsub_obj.image.name
        albumsub_obj.file_name = (albumsub_obj.image.size)/1048576 # in MB
        albumsub_obj.save()
        return albumsub_obj
    def update(self,instance, validated_data):
        data = self.context['request'].data
        for key in ['background_color','caption','font_color','positons']:
            try:
                setattr(instance , key , validated_data[key])
            except Exception as e:
                print(e)
        if 'album' in data:
            instance.album = Album.objects.get(id=int(data['album']))
        instance.save()
        return instance
    
class SimilarUserSearchSerializer(serializers.ModelSerializer):
    similaruserdetails = serializers.SerializerMethodField()
    class Meta:
        model = SimilarUserSearch
        fields = '__all__'
    def get_similaruserdetails(self,instance):
        if instance.similar_user_id is not None:
            user = User.objects.get(id=instance.similar_user_id)           
            return {"name":f'{user.first_name} {user.last_name}',"email":user.email,"mobile":user.mobile,"username":user.username}


class AlbumSerializer(serializers.ModelSerializer):
    subimages = serializers.SerializerMethodField()
    topics = serializers.SerializerMethodField()
    user_details = serializers.SerializerMethodField()
    class Meta:
        model = Album
        fields = '__all__'
    def create(self, validated_data):
        album = Album(**validated_data)
        data = self.context['request'].data
        album.save()
        if 'upload_topics' in data:
            for topic in data['upload_topics']:
                create_topic,created = Topic.objects.get_or_create(title=topic)
                album.topics.add(album_sub_obj)
        return album
    def update(self,instance, validated_data):
        data = self.context['request'].data
        for key in ['title','status']:
            try:
                setattr(instance , key , validated_data[key])
            except Exception as e:
                print(e)
        if 'upload_topics' in data:
            for topic in data['upload_topics']:
                create_topic,created = Topic.objects.get_or_create(title=topic)
                instance.topics.add(album_sub_obj)
        if 'remove_topics' in data:
            for removepic in data['remove_pics']:
                topic = Topic.objects.get_or_create(title=topic)
                instance.pics.remove(topic)
        instance.save()
        return instance
    def get_subimages(self,instance) -> List[dict]:
        #filezie in mb
        return [{"imagepath":pic.imageUrl,"filesize":instance.file_size if instance.imageUrl is not None else None,"description":instance.caption,"position":instance.positons,"posted_ago":get_timebefore(instance.created)} for pic in instance.albumsubs.all()]
    def get_topics(self,instance) -> List[str]:
        return [topic.title for topic in instance.topic.all()]