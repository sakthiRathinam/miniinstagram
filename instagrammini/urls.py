from django.contrib import admin
from django.urls import path,include
from rest_framework import routers
from .views import *
router = routers.DefaultRouter()
router.register(r'clinics' , ClinicViewSet , basename = 'sad')
router.register(r'recopinists' , RecopinistViewSet , basename = 'recopinists')

urlpatterns = [
    path('',include(router.urls)),
    path('createClinic/',CreateClinic.as_view()),
    
    
]