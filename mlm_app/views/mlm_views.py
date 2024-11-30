from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404, redirect, render
from django.urls import reverse_lazy
from django.views import generic
from django.views.generic import ListView
from ..models import Film, LT_Viewer_Seen, LT_Viewer_Watchlist, Viewer





def index(request):
    return render(request, "mlm_app/index.html")

