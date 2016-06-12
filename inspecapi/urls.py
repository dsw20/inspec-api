from django.conf.urls import patterns, include, url
from django.contrib import admin
from api.urls import v1_api

urlpatterns = patterns(
    '',
    
    url(r'^admin/', include(admin.site.urls)),
    url(r'^api/', include(v1_api.urls))
)
