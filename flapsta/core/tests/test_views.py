from django.test import TestCase
from django.test.client import Client
from django.core.urlresolvers import reverse

from core.views import ContactView
from core.models import Contact, Newsletter 
from core.forms import ContactForm, NewsletterForm


class ViewTests(TestCase):

	def test_ContacView(self):
		response = self.client.get(reverse('core:contact'))
		self.assertEqual(response.status_code, 200)

	def test_TermsAndConditionsView(self):
		response = self.client.get(reverse('core:terms_and_conditions'))
		self.assertEqual(response.status_code, 200)
		self.assertEqual(response.context['company_name'], 'Flapsta')
		self.assertNotEqual(response.context['ideas'], None)

	def test_PrivacyPolicyView(self):
		response = self.client.get(reverse('core:privacy_policy'))
		self.assertEqual(response.status_code, 200)
		self.assertEqual(response.context['company_name'], 'Flapsta')
		self.assertNotEqual(response.context['ideas'], None)

