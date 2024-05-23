from django.urls import path
from main import views

urlpatterns = []

url_and_view = {
    '': 'views_index',
    'index': 'views_index',
    'main': 'views_main',
    'main_imonlyhuman': 'views_main_imonlyhuman',
    'main_legend': 'views_main_legend',
    'main_undergraduate_details': 'views_main_undergraduate_details',
    'main_undergraduate_summary': 'views_main_undergraduate_summary'
}

url_and_view_items = url_and_view.items()

for key, value in url_and_view_items:
    pattern = path(key, getattr(views, value), name=value)
    urlpatterns.append(pattern)
