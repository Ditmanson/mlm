from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views
from django.urls import path, include
from rest_framework.routers import DefaultRouter


from .views.mlm_views import *

# Create a router and register all the viewsets
router = DefaultRouter()


urlpatterns = [
    # Home page
    path("", index, name="index"),
    path("index", index, name="index"),
]