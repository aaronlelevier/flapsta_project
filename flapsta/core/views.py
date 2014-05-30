from random import randrange

from django.contrib import auth 
from django.conf import settings
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.template import Template, Context, RequestContext, loader
from django.core.urlresolvers import reverse, reverse_lazy
from django.core.mail import send_mail, EmailMessage
from django.template.loader import get_template
from django.shortcuts import render, get_object_or_404
from django.views.generic import ListView
from django.views.generic.base import TemplateView, RedirectView
from django.views.generic.edit import FormView, CreateView, UpdateView, DeleteView, FormMixin
from django.views.generic.detail import DetailView
from django.contrib.auth.models import User 
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.contrib import messages
from django.contrib.auth.decorators import login_required, permission_required
from django.utils.decorators import method_decorator

from braces.views import LoginRequiredMixin, PermissionRequiredMixin

from .models import Contact, Newsletter, Flapster
from .forms import ContactForm, LoginForm, RegisterForm, Forgot_Password, Reset_Password
from .helpers import contact_email, signup_email, login_messages, salt, short_salt, forgot_password_email
from products.models import Idea, Product 
from products.views import BaseTemplateView



class ContactView(FormView):
	"""
	ContactForm is a ModelForm
	"""
	template_name = 'core/contact-us.html'
	form_class = ContactForm
	success_url = reverse_lazy('products:index')

	def form_valid(self, form):
		cd = form.cleaned_data
		contact = Contact.objects.create(**form.cleaned_data)
		if contact:
			print 'contact created'
		else:
			print 'not created'
		if contact is not None:
			# send contact email
			msg = contact_email(name=cd['name'], email=cd['email'], subject=cd['subject'], message=cd['message'])
			msg.send()
			# Add success message 
			msg = 'Your contact email has been successfully sent.  We look forward to speaking with you.'
			messages.info(self.request, msg)
		return super(ContactView, self).form_valid(form)

	def get_context_data(self, **kwargs):
		context = super(ContactView, self).get_context_data(**kwargs)
		context['ideas'] = Idea.objects.all()
		context['form_title_A'] = 'Contact'
		context['form_title_B'] = 'Us'
		return context


class WholesalerContactView(ContactView):
	"""
	Inherits from ContactView, just adds some extra 
	Wholesaler specific verbiage
	"""
	def get_context_data(self, **kwargs):
		context = super(WholesalerContactView, self).get_context_data(**kwargs)
		context['form_title_A'] = 'Wholesaler'
		context['form_title_B'] = 'Contact'
		return context


class TermsAndConditionsView(BaseTemplateView):

	template_name = 'core/terms_and_conditions.html'

	def get_context_data(self, **kwargs):
		context = super(TermsAndConditionsView, self).get_context_data(**kwargs)
		context['company_name'] = 'Flapsta'
		return context


class PrivacyPolicyView(TermsAndConditionsView):
	"""
	Inherits BaseTemplateView for Idea context
	and Terms-n-Cond for Company Name 
	"""
	template_name = 'core/privacy_policy.html'


def login(request):
	return render(request, 'core/shop-login.html', {'title': 'Login'})


@login_required(login_url='/login/')
def private(request):
	msg = 'You are now logged in.'
	messages.info(request, msg)
	return HttpResponseRedirect(reverse('products:index'))


def login_error(request):
	msg = 'Login unsuccessful. Please try again.'
	messages.warning(request, msg)
	return HttpResponseRedirect(reverse('core:login'))


@login_required(login_url=reverse_lazy('core:login'))
def logout(request):
	auth.logout(request)
	messages.info(request, 'You are now logged out')
	return HttpResponseRedirect(reverse('products:index'))


def login_flapsta(request):
	ideas = Idea.objects.all()
	if 'login' in request.POST:
		login_form = LoginForm(request.POST)
		register_form = RegisterForm()
		context = {'ideas':ideas, 'login_form': login_form, 'register_form': register_form}
		if login_form.is_valid():
			cd = login_form.cleaned_data
			user = auth.authenticate(username=cd['login_username'], password=cd['login_password'])
			# Login Active Users
			if user is not None and user.is_active:
				login_form.login_user(request, user)
				return HttpResponseRedirect(reverse('products:index'))
			# Show error if Username and PW don't match
			else:
				login_form.user_cant_login(request, user)
				return HttpResponseRedirect(reverse('core:login_flapsta'), context)

	elif 'register' in request.POST:
		register_form = RegisterForm(request.POST)
		login_form = LoginForm()
		context = {'ideas':ideas, 'login_form': login_form, 'register_form': register_form}
		if register_form.is_valid():	
			cd = register_form.cleaned_data
			username_taken = register_form.username_taken(request)
			if username_taken:
				return HttpResponseRedirect(reverse('core:login_flapsta'), context)
			else:	
				user = User.objects.create_user(username=cd['register_username'],
											email=cd['register_email'],
											password=cd['register_password'])
				is_registered = register_form.register_user(request, user, cd)
				if is_registered: return HttpResponseRedirect(reverse('core:login'))
	else:
		login_form = LoginForm()
		register_form = RegisterForm()
	return render(request, 'core/shop-login.html', {'ideas': ideas, 'login_form': login_form, 
												'register_form': register_form})


def activate(request, pk, salt):
	user = User.objects.get(pk=pk)
	user.is_active = True
	user.save()
	msg = login_messages['account_active']
	messages.info(request, msg)
	return HttpResponseRedirect(reverse('core:login_flapsta'))



class ForgotPasswordView(FormView):

	template_name = 'core/forgot_password.html'
	form_class = Forgot_Password
	success_url = reverse_lazy('core:password_email_sent')

	def form_valid(self, form):
		cd = form.cleaned_data
		username = cd['username']
		email = cd['email']
		try:
			user = User.objects.get(username=cd['username'], email=cd['email'])
			messages.info(self.request, 'A reset password email has been sent. Please check your email.')
		except:
			messages.warning(self.request, 'No matching account with that username and email.')
			return HttpResponseRedirect(reverse('core:forgot_password'))
		if user.email == email and user is not None and user.is_active:
			temp_password = short_salt()
			user.set_password(temp_password)
			user.save()
			msg = forgot_password_email(username, email, temp_password)
			msg.send()
		return super(ForgotPasswordView, self).form_valid(form)


class PasswordEmailSentView(TemplateView):

	template_name = 'core/password_email_sent.html'


class ResetPasswordView(FormView):

	template_name = 'core/reset_password.html'
	form_class = Reset_Password
	success_url = reverse_lazy('products:index')

	def form_valid(self, form):
		cd = form.cleaned_data
		form.clean_username()
		user = auth.authenticate(username=cd['username'], password=cd['temp_password'])
		if user is not None and user.is_active:
			user.set_password(cd['new_password'])
			user.save()
			user = auth.authenticate(username=cd['username'], password=cd['new_password'])
			messages.info(self.request, 'Your password has been reset.  You are now logged in.')
			auth.login(self.request, user)
		return super(ResetPasswordView, self).form_valid(form)










