import os

from django.conf import settings
from django.test import TestCase, LiveServerTestCase
from django.test.client import Client
from django.core.urlresolvers import reverse
from django.contrib.auth.models import User
from django.template.defaultfilters import slugify
from django.contrib.staticfiles import finders
from django.contrib.staticfiles.storage import staticfiles_storage

from products.models import Product, Color, Idea, Star


class ImageStorageTests(TestCase):

	# load fixtures
	fixtures = ['product_data.json', 'admin.json']

	def setUp(self):
		pass

	def test_images(self):
		"""
		Use the abs_path to test if the image location saved in the Product
		exits in the static files
		"""
		products = Product.objects.all()
		for prod in products:
			abs_path = finders.find(prod.image_one)
			self.assertTrue(staticfiles_storage.exists(abs_path))


class ModelTests(TestCase):

	# load fixtures
	fixtures = ['product_data.json', 'admin.json']

	def setUp(self):
		pass

	def test_product_slugs(self):
		products = Product.objects.all()
		for product in products:
			self.assertEqual(product.slug, slugify(product.title))

	def test_counts(self):
		products = Product.objects.count()
		print 'Products:', products
		ideas = Idea.objects.count()
		print 'Ideas:', ideas
		colors = Color.objects.count()
		print 'Colors:', colors

	def test_each_product_has_a_idea(self):
		products = Product.objects.all()
		for prod in products:
			prod_ideas = prod.ideas.all()
			self.assertNotEqual(len(prod_ideas), 0)

	def test_each_product_has_a_color(self):
		products = Product.objects.all()
		for prod in products:
			prod_colors = prod.colors.all()
			self.assertNotEqual(len(prod_colors), 0)

	def test_vote(self):
		# delete all votes
		votes  = Star.objects.all()
		for vote in votes:
			vote.delete()
		# User login and vote
		user = User.objects.get(username=os.environ['flapsta_admin_username'])
		self.client.login(username=os.environ['flapsta_admin_username'], password=os.environ['flapsta_admin_password'])
		product = Product.objects.all()[0]
		votes = Star.objects.create(user_id=user.id, product_id=product.id)
		self.assertNotEqual(votes, None)
		all_votes = Star.objects.all()
		self.assertEqual(len(all_votes), 1)
		# test that the User voted for the Product
		user_voted = Star.objects.user_voted(user_id=user.id, product_id=product.id)
		self.assertTrue(user_voted)
		# Product votes count
		self.assertEqual(product.votes(), 1)
		self.assertTrue(product.has_votes())



