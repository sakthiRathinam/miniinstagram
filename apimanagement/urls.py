from django.contrib import admin
from django.urls import path,include

urlpatterns = [
    path('miniinstagram/', include('instagrammini.urls')),
]
