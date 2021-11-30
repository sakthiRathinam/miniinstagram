from django.shortcuts import render
from django.db.models import F ,Value,CharField,Q
from django.contrib.auth.models import User , Group
from django.http import JsonResponse
from math import radians, cos, sin, asin, sqrt, atan2
from rest_framework import viewsets , permissions , serializers
from rest_framework.pagination import LimitOffsetPagination
from .models import *
from rest_framework import parsers
from url_filter.integrations.drf import DjangoFilterBackend
from .serializers import *
from rest_framework.views import APIView
from .service import api_view_pagination , get_timebefore,get_timeleft
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import login_required, permission_required
from django.core.files import File as DjangoFile
from rest_framework.parsers import FileUploadParser, FormParser, MultiPartParser
# Create your views here.


##############################################################viewsets#################################################################################################
################################################performance not up to mark easy to implement############################################################################


class AlbumViewSet(viewsets.ModelViewSet):
    filter_backends = [DjangoFilterBackend]
    serializer_class = AlbumSerializer
    permission_classes = (permissions.AllowAny , )
    filter_fields = ['created_by']
    def get_queryset(self):
        params=self.request.GET
        to_return = Album.objects.all()
        if 'useralbums' in data:
            to_return = to_return.filter(created_by_id=params['useralbums'])
            return to_return
        if 'otheralbums' in data:
            to_return = to_return.filter(status='Published').exclude(created_by_id=params['otheralbums'])
            return to_return
        if 'topic' in params:
            req_topic = Topic.objects.get(id=int(params['topic'])).prefetch_related('usersubscribedtopics')
            to_return = req_topic.usersubscribedtopics.all()
        return to_return
    
    
class TopicViewSet(viewsets.ModelViewSet):
    filter_backends = [DjangoFilterBackend]
    serializer_class = TopicSerializer
    permission_classes = (permissions.AllowAny , )
    filter_fields = ['title']
    def get_queryset(self):
        params=self.request.GET
        to_return = Topic.objects.all()
        return to_return
class AlbumSubsViewSet(viewsets.ModelViewSet):
    filter_backends = [DjangoFilterBackend]
    serializer_class = TopicSerializer
    permission_classes = (permissions.AllowAny , )
    filter_fields = ['caption','font_color','background_color']
    def get_queryset(self):
        params=self.request.GET
        to_return = AlbumSubs.objects.all()
        if 'album' in params:
            album_obj = Album.objects.get(id=int(params['album']))  
        return to_return
    
class Similaruser(viewsets.ModelViewSet):
    filter_backends = [DjangoFilterBackend]
    serializer_class = TopicSerializer
    permission_classes = (permissions.AllowAny , )
    filter_fields = []
    def get_queryset(self):
        params=self.request.GET
        to_return = Topic.objects.all()
        if 'user' in params:
            to_return = to_return.filter(user_id=int(params['user'])).order_by('-similarty_score')
        return to_return
    
    






















###########################################################################################################################################################################


###############################APIView for the same requirement compare to viewset is 5 to 10 times faster and serializing should be done by us manually then only we are able to acehive the efficinet#######################################################

class UserDashboard(APIView):
    permission_classes = (permissions.AllowAny , )
    def get(self,request,format=None):
        params = request.GET
        
        if 'user' in params:
            user = User.objects.prefetch_related('useralbums','useralbums__albumsubs','useralbums__topics').get(id=int(params['user']))            
            to_send = {
                "published":[{"posted_ago":get_timebefore(album),"topics":[topic.title for topic in album.topics.all()],"title":album.title,"hashtags":album.HashTags,"pics":[{"imagepath":pic.imageUrl,"filesize":instance.file_size if instance.imageUrl is not None else None,"description":instance.caption,"position":instance.positons,"posted_ago":get_timebefore(instance.created)} for pic in album.albumsubs.all()]}for album in user.useralbums.filter(status="Published")],
                "notpublished":[{"posted_ago":get_timebefore(album),"topics":[topic.title for topic in album.topics.all()],"title":album.title,"hashtags":album.HashTags,"pics":[{"imagepath":pic.imageUrl,"filesize":instance.file_size if instance.imageUrl is not None else None,"description":instance.caption,"position":instance.positons,"posted_ago":get_timebefore(instance.created)} for pic in album.albumsubs.all()]}for album in user.useralbums.filter(status="NotPublished")],
                "drafts":[{"posted_ago":get_timebefore(album),"topics":[topic.title for topic in album.topics.all()],"title":album.title,"hashtags":album.HashTags,"pics":[{"imagepath":pic.imageUrl,"filesize":instance.file_size if instance.imageUrl is not None else None,"description":instance.caption,"position":instance.positons,"posted_ago":get_timebefore(instance.created)} for pic in album.albumsubs.all()]}for album in user.useralbums.filter(status="Draft")],
            }
            return JsonResponse(to_send,safe=False)
        return JsonResponse({"failed":"please enter the user id"},status=500)
            
class CreateAlbum(APIView):
    permission_classes = (permissions.AllowAny , )
    def post(self,request,format=None):
        data = request.data
        if 'created_by' and 'title' in data:
            try:
                data_dict = request.data.copy()
                created_by = data_dict.data.pop('created_by')
                topics = data_dict.data.pop('topics')
                album_obj = Album(**data_dict)
                album_obj.created_by_id = created_by
                album_obj.save()
                for topic in topics:
                    topic_obj,created = Topic.objects.get_or_create(title=topic)
                    album_obj.topics.add(topic_obj)
                return JsonResponse({"success":"album created successfully","created_id":album_obj.id},status=201)
            except Exception as e:
                print(e)
                return JsonResponse({"success":"please enter the required info or server error","created_id":album_obj.id},status=500)
    ########paginated get apiview####################
    def get(self,request,format=None):
        params_dict = request.GET.copy()
        if 'limit' and 'offset' in params_dict:
            limit = params_dict['limit']
            offset = params_dict['offset']
        else:
            limit = 10
            offset = 0
        if 'current_user' in data:
            user = User.objects.get(id=int(params_dict['current_user']))
        else:
            user = request.user
        if 'useralbums' in data:
            to_send = api_view_pagination(Album,filter={created_by_id:int(data['useralbums'])},limit=limit,offset=offset)
            serialized_data = []
            for album in to_send['data']:
                serialized_data.append({"posted_ago":get_timebefore(album),"topics":[topic.title for topic in album.topics.all()],"title":album.title,"hashtags":album.HashTags,"pics":[{"imagepath":pic.imageUrl,"filesize":instance.file_size if instance.imageUrl is not None else None,"description":instance.caption,"position":instance.positons,"posted_ago":get_timebefore(instance.created)} for pic in album.albumsubs.all()]})
            to_send['data'] = serialized_data
            return JsonResponse(to_send,safe=False)
        if 'otheralbums' in data:
            to_return = to_return.filter(status="Published").exclude(created_by_id=params['otheralbums'])
            to_send = api_view_pagination(Album,filter={status:"Published"},exclude={"created_by_id":params['otheralbums']},limit=limit,offset=offset)
            to_send['data'] = [{"posted_ago":get_timebefore(album),"topics":[topic.title for topic in album.topics.all()],"title":album.title,"hashtags":album.HashTags,"pics":[{"imagepath":pic.imageUrl,"filesize":instance.file_size if instance.imageUrl is not None else None,"description":instance.caption,"position":instance.positons,"posted_ago":get_timebefore(instance.created)} for pic in album.albumsubs.all()]} for album in to_send['data']]
            return JsonResponse(to_send,safe=False)
            
class similar_user_search(APIView):
    def get(self,request,format=None):
        params_dict = request.GET.copy()
        if 'limit' and 'offset' in params_dict:
            limit = params_dict['limit']
            offset = params_dict['offset']
        else:
            limit = 10
            offset = 0
        if 'user' in params_dict:
            to_send = api_view_pagination(SimilarUserSearch,filter={user_id:int(params_dict['user'])},limit=limit,offset=offset)
            to_send['data'] = [{"similarty_score":user.similarty_score,"userdetails":{}} for user in to_send['data']]
                
    
        

        
        
        
        
        
    






