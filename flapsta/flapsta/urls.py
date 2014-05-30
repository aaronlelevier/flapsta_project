from django.conf.urls import patterns, include, url

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',

	url(r'^akiaaron/doc/', include('django.contrib.admindocs.urls')),
	url(r'^akiaaron/', include(admin.site.urls)),

	# Product URLs
	url(r'', include('products.urls', namespace='products')),
	# Core URLs
	url(r'', include('core.urls', namespace='core')),
	# Social URLs
	url(r'', include('social_auth.urls')),
	# FB Like Button 
	# url(r'', include('like_button.urls')),

)
