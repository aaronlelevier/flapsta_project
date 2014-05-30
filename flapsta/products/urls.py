from django.conf.urls import patterns, url

from products import views

urlpatterns = patterns('',
	url(r'^$', views.IndexView.as_view(), name='index'),

	# Portfolio Pages
	url(r'^portfolio/$', views.PortfolioView.as_view(), name='portfolio'),
	url(r'^portfolio/filtered/(?P<slug>[\w\d\-\_]+)/$', views.portfolio_filtered, name='portfolio_filtered'),
	url(r'^portfolio/filtered/$', views.portfolio_filtered, name='portfolio_filtered_two'),
	# Idea Pages
	url(r'^portfolio/designs/(?P<slug>[\w\d\-\_]+)/$', views.IdeaView.as_view(), name='idea'),
	#Single Product Page
	url(r'^products/(?P<slug>[\w\d\-\_]+)/$', views.ProductView.as_view(), name='product'),
	url(r'^products/(?P<slug>[\w\d\-\_]+)/$', views.RecommendedProductView.as_view(), name='recommended_product'),
	url(r'^product-search/$', views.ProductSearchView, name='product_search'),
	url(r'^vote-for-product/(?P<slug>[\w\d\-\_]+)/$', views.vote_for_product, name='vote_for_product'),

	# Static Pages
	url(r'^how-to-apply/$', views.HowToApplyView.as_view(), name='how_to_apply'),
	url(r'^features/$', views.FeaturesView.as_view(), name='features'),

	)