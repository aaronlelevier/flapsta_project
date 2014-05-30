from django.test import TestCase
from django.test.client import Client
from django.core.urlresolvers import reverse

from core.views import ContactView
from core.models import Contact, Newsletter 
from core.forms import ContactForm


def create_contact(name):
	name = u"%s" % name
	email = u"%s@gmail.com" % name
	subject = u"question from %s" % name
	message = u"message from %s" % name
	contact = Contact.objects.create(name=name, email=email, subject=subject, message=message)
	return contact

class ModelTests(TestCase):

	def setUp(self):
		self.myContact = create_contact("Aaron")
		self.myNewsletter = Newsletter.objects.create(email=self.myContact.email)

	def test_create(self):
		contacts = Contact.objects.all()
		newsletters = Newsletter.objects.all()
		self.assertNotEqual(contacts, None)
		self.assertNotEqual(newsletters, None)

	def test_newsletter_default(self):
		self.assertTrue(self.myNewsletter.subscribe)

