from django.db import models
from django.contrib.auth.models import User
from django.utils.translation import ugettext, ugettext_lazy as _
from django.core.urlresolvers import reverse

from .helpers import salt


class Contact(models.Model):
	name = models.CharField(_("Name"), max_length=100)
	email = models.EmailField(_("Email"), max_length=100)
	subject = models.CharField(_("Subject"), max_length=200)
	message = models.TextField(_("Message"), max_length=2000)

	def __unicode__(self):
		return u"%s : %s" % (self.name, self.email)

	def get_absolute_url(self):
		return reverse('core:contact')


class Newsletter(models.Model):
	email = models.EmailField(_("Email"), max_length=100)
	subscribe = models.BooleanField(_("Subscribe"), blank=True, default=True)

	def __unicode__(self):
		return self.email


class Flapster(models.Model):
	# Joins
	user = models.ForeignKey(User)
	newsletter = models.ForeignKey("Newsletter", null=True, blank=True)
	# Auto Fields
	salt = models.CharField(_("Salt"), max_length=75)

	def save(self, *args, **kwargs):
		if not self.id:
			self.salt = salt() 
		super(Flapster, self).save(*args, **kwargs)