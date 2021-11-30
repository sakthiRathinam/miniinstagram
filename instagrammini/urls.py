from django.contrib import admin
from django.urls import path,include
from rest_framework import routers
from .views import *
router = routers.DefaultRouter()
router.register(r'albums' , AlbumViewSet , basename = 'albums')
router.register(r'topics' , TopicViewSet , basename = 'topics')
router.register(r'albumsubs' , AlbumSubsViewSet , basename = 'albumsubs')
router.register(r'similarusers' , Similaruser , basename = 'similarusers')

urlpatterns = [
    path('',include(router.urls)),
    # path('createClinic/',CreateClinic.as_view()),
    
    
]