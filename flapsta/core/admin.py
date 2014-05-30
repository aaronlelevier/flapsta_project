from django import forms
from django.contrib import admin
from django.db import models
from django.forms import TextInput, Textarea

from .models import Contact, Newsletter, Flapster


class ContactForm(forms.ModelForm):

	class Meta:
		model = Contact

class ContactAdmin(admin.ModelAdmin):
	form = ContactForm
	search_fields = ['name', 'email']
	list_display = ('name', 'email', 'subject',)
	# readonly_fields = ('date',)
	fieldsets = [
		('Info',				{'fields': ['name', 'email']}),
		('Message', 	 		{'fields': ['subject', 'message']}),
		# ('Auto Fields',			{'fields': ['date']})
	]


class NewsletterForm(forms.ModelForm):

	class Meta:
		model = Newsletter

class NewsletterAdmin(admin.ModelAdmin):
	form = NewsletterForm
	search_fields = ['email']
	fieldsets = [
		('Info',			{'fields': ['email', 'subscribe']}),
	]


class FlapsterAdmin(admin.ModelAdmin):
	fieldsets = [
		('Info', 			{'fields': ['user', 'newsletter', 'salt']})
	]




admin.site.register(Contact, ContactAdmin)
admin.site.register(Newsletter, NewsletterAdmin)
admin.site.register(Flapster, FlapsterAdmin)