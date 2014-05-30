from django.conf.urls import patterns, url

from core import views

urlpatterns = patterns('',
	url(r'^contact/$', views.ContactView.as_view(), name='contact'),
	url(r'^wholesale-contact/$', views.WholesalerContactView.as_view(), name='wholesale_contact'),

	# Policy URLs
	url(r'^terms-and-conditions/$', views.TermsAndConditionsView.as_view(), name='terms_and_conditions'),
	url(r'^privacy-policy/$', views.PrivacyPolicyView.as_view(), name='privacy_policy'),

	# Login URLs
	url(r'^login/$', views.login, name='login'),
	url(r'^private/$', views.private, name='private'),
	url(r'^login-error/$', views.login_error, name='login_error'),
    url(r'^logout/$', views.logout, name='logout'),

    # Login URLs for Flapsta
    url(r'^login/flapsta/$', views.login_flapsta, name='login_flapsta'),
	url(r'^activate/(?P<pk>\d+)/(?P<salt>.+)/$', views.activate, name='activate'),
	
	# Reset Password Views
	url(r'^forgot-password/$', views.ForgotPasswordView.as_view(), name='forgot_password'),
	url(r'^reset-password/$', views.ResetPasswordView.as_view(), name='reset_password'),
	url(r'^password-email-sent/$', views.PasswordEmailSentView.as_view(), name='password_email_sent'),

	)