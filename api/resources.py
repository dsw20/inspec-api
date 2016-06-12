from tastypie.resources import ModelResource
from tastypie import fields
from models import Convenio


class ConvenioResource(ModelResource):

    class Meta:
        queryset = Convenio.objects.all()
        resource_name = 'convenio'
