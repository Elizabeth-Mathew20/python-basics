"""e_rto URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from .import views
from django.conf.urls import url
from django.conf import settings
from django.conf.urls.static import static
urlpatterns = [
    path('',views.first),
    path('index',views.index),
    path('userregister',views.userregister),
    path('adduser',views.adduser),
    path('policeregister',views.policeregister),
    path('addpolice',views.addpolice),
    path('checkpostregister',views.checkpostregister),
    path('addcheckpost',views.addcheckpost),
    path('login/',views.login),
    path('logout/',views.logout),
    path('login/addlogin',views.addlogin),
    path('viewusers',views.viewusers),
    path('vehicle',views.vehicle),
    path('search',views.search),
    path('addvehicle',views.addvehicle),
    path('viewvehicle',views.viewvehicle),
    path('viewvehicle_single/<int:id>',views.viewvehicle_single),
    path('qrgenerate/<int:id>/', views.qrgenerate, name='qrgenerate'),
    path('viewvehicle_checkpost',views.viewvehicle_checkpost),
    path('search1',views.search1),
    path('fine/<int:id>/', views.fine, name='fine'),
    path('fine/<int:id>/addfine', views.addfine, name='addfine'),
    path('viewfine',views.viewfine),
    path('payfine/<int:id>', views.payfine, name='payfine'),
    path('payfine/addfinepayment', views.addfinepayment, name='addfinepayment'),
    path('complaint/<int:id>', views.complaint, name='complaint'),
    path('complaint/addcomplaint', views.addcomplaint, name='addcomplaint'),
    path('viewcmplt',views.viewcmplt),
    path('regcomplaint',views.regcomplaint),




    path('admin/', admin.site.urls),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
