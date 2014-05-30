from django import forms 
from django.contrib.auth.models import User
from django.contrib import auth
from django.http import HttpResponseRedirect
from django.contrib import messages
from django.core.urlresolvers import reverse
from django.shortcuts import render

from .models import Contact, Newsletter, Flapster
from .helpers import login_messages, signup_email


class ContactForm(forms.ModelForm):

	class Meta:
		model = Contact  
		fields = ('name', 'email', 'subject', 'message',)
		widgets = {
			'message': forms.Textarea(attrs={'cols': 20, 'rows': 20}),
		}


class LoginForm(forms.Form):
	login_username = forms.CharField(label="Username")
	login_password = forms.CharField(label="Password", widget=forms.PasswordInput)

	def is_active_check(self): 
		username = self.cleaned_data['login_username']
		try:
			user = User.objects.get(username=username) 
			if user is not None and user.is_active == False:
				raise forms.ValidationError("Your account hasn't been activated yet.  Please follow the link in your email to validate your account")
		except:
			raise forms.ValidationError("Username and password do not match")
		return username

	def login_user(self, request, user):
		auth.login(request, user)
		messages.info(request, 'You are logged in.')

	def user_cant_login(self, request, user):
		if user is None:
			messages.info(request, login_messages['no_match'])
		else:
			messages.info(request, login_messages['not_active'])


class RegisterForm(forms.Form):
	register_username = forms.CharField(label="Username")
	register_email = forms.EmailField(label="Email Address")
	register_password = forms.CharField(label="Password", widget=forms.PasswordInput)

	def username_taken(self, request):
		username = self.cleaned_data['register_username']
		if User.objects.filter(username=username).exists():
			messages.info(request, login_messages['username_taken'])
			return True
		else:
			return False

	def register_user(self, request, user, cd):
		if user is None:
			raise forms.ValidationError("Unable to create User")
		else:
			flapster = Flapster.objects.create(user=user)
			# mark User as inactive until they validate via email
			user.is_active = False
			user.save()
			# send confirmation email
			msg = signup_email(username=cd['register_username'], email=cd['register_email'], 
							pk=user.pk, signup_link=flapster.salt)
			msg.send()
			messages.info(request, login_messages['activate_via_email'])
			return True


class NewsletterForm(forms.ModelForm):

	class Meta:
		model = Newsletter
		fields = ('email',)


class Forgot_Password(forms.Form):
	username = forms.CharField()
	email = forms.EmailField()


class Reset_Password(forms.Form):
	username = forms.CharField()
	temp_password = forms.CharField()
	new_password = forms.CharField(widget=forms.PasswordInput)

	def clean_username(self):
		username = self.cleaned_data['username']
		if not User.objects.filter(username=username).exists():
			raise forms.ValidationError("Invalid Username")
		return username



