import unittest
from random import randrange

from django.conf import settings
from django.test import TestCase, LiveServerTestCase, RequestFactory
from django.test.client import Client
from django.core.urlresolvers import reverse
from django.contrib.auth.models import User

from selenium.webdriver.common.keys import Keys
from selenium.webdriver.firefox.webdriver import WebDriver 
from selenium.webdriver.support.ui import WebDriverWait # available since 2.4.0
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By

from products.models import Product, Idea, Color, Star 
from products.views import *
from products.my_data import CreateTestData
from products.helpers import portfolio_filters


class TestImages(TestCase):

	def test_images(self):
		i = 1
		f = open('/users/yuki_aaron/downloads/flapsta_image_urls.txt')
		for line in f:
			response = self.client.get(line)
			try:
				self.assertEqual(response.status_code, 200)
				self.assertIn('jpg', body.text)
			except:
				print line
				i += 1
		print 'total', i


class SeleniumFlapstaImages(LiveServerTestCase):

	# load fixtures
	fixtures = ['product_data.json', 'admin.json']

	def setUp(self):
		self.browser = WebDriver()

	def tearDown(self):
		self.browser.quit()

	def test_admin_site(self):
		i = 1
		f = open('/users/yuki_aaron/downloads/flapsta_image_urls.txt')
		while i <= 20:
			for line in f:
				self.browser.get(line)
				try:
					body = self.browser.find_element_by_tag_name('body')
					self.assertIn(line, body.text)
				except:
					print line
					i += 1
		print i 



class ViewContext(TestCase):

	# load fixtures
	fixtures = ['product_data.json', 'admin.json']

	def setUp(self):
		self.ideas = Idea.objects.all()

	def test_index_ideas(self):
		response = self.client.get(reverse('products:index'))
		self.assertEqual(len(response.context['ideas']), len(self.ideas))

	def test_index_ideas_url(self):
		response = self.client.get(reverse('products:index'))
		ideas = response.context['ideas']
		for ea in ideas:
			response = self.client.get(ea.get_absolute_url())
			self.assertEqual(response.status_code, 200)

	def test_index_idea_titles(self):
		response = self.client.get(reverse('products:index'))
		for ea in response.context['ideas']:
			self.assertNotEqual(len(ea.name), 0)

	def test_index_featured_products(self):
		response = self.client.get(reverse('products:index'))
		self.assertEqual(len(response.context['featured_products']), 12)
		for ea in response.context['featured_products']:
			self.assertNotEqual(len(ea.title), 0)
			self.assertNotEqual(len(ea.image_one), 0)
			self.assertNotEqual(ea.get_absolute_url, None)

	def test_index_featured_products_url(self):
		response = self.client.get(reverse('products:index'))
		products = response.context['featured_products']
		for ea in products:
			response = self.client.get(ea.get_absolute_url())
			self.assertEqual(response.status_code, 200)

	def test_index_design_count(self):
		response = self.client.get(reverse('products:index'))
		self.assertEqual(response.context['design_count'], Product.objects.count())

	def test_index_recommended_product(self):
		response = self.client.get(reverse('products:index'))
		self.assertNotEqual(response.context['recommended_product'], None)

	def test_index_recommended_product_url(self):
		response = self.client.get(reverse('products:index'))
		response = self.client.get(response.context['recommended_product'].get_absolute_url())
		self.assertEqual(response.status_code, 200)


class ViewPortfolioContext(TestCase):

	# load fixtures
	fixtures = ['product_data.json', 'admin.json']

	def setUp(self):
		self.ideas = Idea.objects.all()

	def test_each_pagination(self):
		product_count = Product.objects.count()
		pages = product_count / 12
		if product_count % 12 != 0: pages += 1
		for i in range(pages):
			response = self.client.get('/portfolio/?page=' + str(i))
			self.assertEqual(response.status_code, 200)

	def test_portfolio_filtered(self):
		for k, v in portfolio_filters.items():
			response = self.client.get(reverse('products:portfolio_filtered', kwargs={'slug': k}))
			self.assertEqual(response.status_code, 200)

	def test_portfolio_filtered_two(self):
		for k, v in portfolio_filters.items():
			response = self.client.get(reverse('products:portfolio_filtered_two') + k + '/')
			self.assertEqual(response.status_code, 200)

	def test_idea_get_absolute_url(self):
		ideas = Idea.objects.all()
		for idea in ideas:
			response = self.client.get(idea.get_absolute_url())
			self.assertEqual(response.status_code, 200)

	def test_idea_without_get_absolute_url(self):
		ideas = Idea.objects.all()
		for idea in ideas:
			response = self.client.get(reverse('products:idea', kwargs={'slug': idea.slug}))
			self.assertEqual(response.status_code, 200)


class ViewTestsProduct(TestCase):

	# load fixtures
	fixtures = ['product_data.json', 'admin.json']

	def setUp(self):
		pass

	def test_product_pages(self):
		product = Product.objects.get(title__icontains='Abstract Flowers')
		response = self.client.get(reverse('products:product', kwargs={'slug':product.slug}))
		self.assertEqual(response.status_code, 200)
		self.assertEqual(response.context_data['product'].title, product.title)
		self.assertEqual(response.context_data['product'].slug, product.slug)

	def test_product_pages_all(self):
		products = Product.objects.all()
		for product in products:
			response = self.client.get(reverse('products:product', kwargs={'slug':product.slug}))
			self.assertEqual(response.status_code, 200)
			self.assertEqual(response.context_data['product'].title, product.title)
			self.assertEqual(response.context_data['product'].slug, product.slug)
			# test color_products and idea_products
			try:
				self.assertEqual(len(response.context_data['color_products']), 3)
			except:
				print 'color_products:', product.title
			try:
				self.assertEqual(len(response.context_data['idea_products']), 4)
			except:
				print 'idea_products:', product.title


class ViewTests(TestCase):

	# load fixtures
	fixtures = ['product_data.json', 'admin.json']

	def setUp(self):
		pass

	def tearDown(self):
		pass

	def test_views_index(self):
		response = self.client.get(reverse('products:index'))
		self.assertEqual(response.status_code, 200)
		self.assertNotEqual(response.context_data, None)
		self.assertEqual(len(response.context_data['featured_products']), 12)
		self.assertEqual(len(response.context_data['ideas']), Idea.objects.count())
		self.assertNotEqual(response.context_data['recommended_product'], None)

	def test_views_portfolio(self):
		response = self.client.get(reverse('products:portfolio'))
		self.assertNotEqual(response.context, None)
		self.assertEqual(response.status_code, 200)
		self.assertEqual(len(response.context['ideas']), Idea.objects.count())

	def test_views_recommended_product(self):
		# recommended product
		total_products = Product.objects.count()
		product_pk = randrange(1, total_products)
		try:
			recommended_product = Product.objects.all()[product_pk]
		except:
			recommended_product = Product.objects.all()[0]
		product = Product.objects.all()[0]
		response = self.client.get(reverse('products:recommended_product', kwargs={'slug':recommended_product.slug}))
		self.assertEqual(response.status_code, 200)

	def test_views_product_search(self):
		response = self.client.get('/product-search/?q=z/')
		self.assertEqual(response.status_code, 200)

	def test_views_how_to_apply(self):
		response = self.client.get(reverse('products:how_to_apply'))
		self.assertEqual(response.status_code, 200)

	def test_views_features(self):
		response = self.client.get(reverse('products:features'))
		self.assertEqual(response.status_code, 200)



class SeleniumViewTests(LiveServerTestCase):

	# load fixtures
	fixtures = ['product_data.json', 'admin.json']

	def setUp(self):
		self.browser = WebDriver()

	def tearDown(self):
		self.browser.quit()

	def test_admin_site(self):
		# user opens web browser, navigates to admin page
		self.browser.get(self.live_server_url + '/akiaaron/')
		body = self.browser.find_element_by_tag_name('body')
		self.assertIn('Django administration', body.text)

	def test_get_admin(self):
		# Get Admin User
		admin = User.objects.get(username='admin')
		self.assertTrue(admin.is_staff)

	def test_admin_login(self):
		# users types in username and passwords and presses enter
		self.browser.get(self.live_server_url + '/admin/')
		username_field = self.browser.find_element_by_name('username')
		username_field.send_keys('admin')
		password_field = self.browser.find_element_by_name('password')
		password_field.send_keys('1234')
		password_field.send_keys(Keys.RETURN)

		# login credentials are correct, and the user is redirected to the main admin page
		body = self.browser.find_element_by_tag_name('body')
		self.assertIn('Site administration', body.text)

	def test_index(self):
		self.browser.get(self.live_server_url)
		body = self.browser.find_element_by_tag_name('body')
		self.assertIn('Recent Tweets', body.text)

	def test_portfolio(self):
		view = reverse('products:portfolio')
		self.browser.get('%s%s' % (self.live_server_url, view))
		body = self.browser.find_element_by_tag_name('body')
		self.assertIn('Shop', body.text)

	def test_all_ideas(self):
		ideas = Idea.objects.all()
		for idea in ideas:
			# Get View for each Idea
			view = reverse('products:idea', kwargs={'slug': idea.slug})
			self.browser.get('%s%s' % (self.live_server_url, view))
			body = self.browser.find_element_by_tag_name('body')
			# Make sure at least one product is under each Idea
			prod = Product.objects.filter(ideas=idea)
			if len(prod) > 0: 
				prod = prod[0]
				WebDriverWait(self.browser, 2)
				try:
					self.assertIn(prod.title, body.text)
				except:
					print "Didn't render:", idea.name
			else:
				print 'No products attached:', idea.name

	def test_portfolio_filtered(self):
		self.browser.get(self.live_server_url + '/portfolio/filtered/-created/')
		body = self.browser.find_element_by_tag_name('body')
		self.assertIn('results', body.text)

	def test_features(self):
		self.browser.get(self.live_server_url + '/features/')
		body = self.browser.find_element_by_tag_name('body')
		self.assertIn('Features', body.text)

	def test_how_to_apply(self):
		self.browser.get(self.live_server_url + '/how-to-apply/')
		body = self.browser.find_element_by_tag_name('body')
		self.assertIn('How to Apply', body.text)

	def test_product_single(self):
		prod = Product.objects.all()[0]
		prod_url = '/products/%s/' % prod.slug
		self.browser.get(self.live_server_url + prod_url)
		body = self.browser.find_element_by_tag_name('body')
		self.assertIn(prod.title, body.text)

	def test_products_all_one(self):
		products = Product.objects.all()[:20]
		for prod in products:
			prod_url = '/products/%s/' % prod.slug
			self.browser.get(self.live_server_url + prod_url)
			body = self.browser.find_element_by_tag_name('body')
			self.assertIn(prod.title, body.text)

	def test_products_all_two(self):
		products = Product.objects.all()[20:40]
		for prod in products:
			prod_url = '/products/%s/' % prod.slug
			self.browser.get(self.live_server_url + prod_url)
			body = self.browser.find_element_by_tag_name('body')
			self.assertIn(prod.title, body.text)

	def test_products_all_three(self):
		products = Product.objects.all()[40:60]
		for prod in products:
			prod_url = '/products/%s/' % prod.slug
			self.browser.get(self.live_server_url + prod_url)
			body = self.browser.find_element_by_tag_name('body')
			self.assertIn(prod.title, body.text)

	def test_products_all_four(self):
		products = Product.objects.all()[60:80]
		for prod in products:
			prod_url = '/products/%s/' % prod.slug
			self.browser.get(self.live_server_url + prod_url)
			body = self.browser.find_element_by_tag_name('body')
			self.assertIn(prod.title, body.text)

	def test_products_all_five(self):
		products = Product.objects.all()[80:]
		for prod in products:
			prod_url = '/products/%s/' % prod.slug
			self.browser.get(self.live_server_url + prod_url)
			body = self.browser.find_element_by_tag_name('body')
			self.assertIn(prod.title, body.text)














