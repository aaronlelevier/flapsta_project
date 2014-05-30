from django.test import TestCase, LiveServerTestCase
from django.test.client import Client
from django.core.urlresolvers import reverse
from django.contrib.auth.models import User 
from django.contrib.auth import SESSION_KEY

from selenium.webdriver.common.keys import Keys
from selenium.webdriver.firefox.webdriver import WebDriver 
from selenium.webdriver.support.ui import WebDriverWait # available since 2.4.0
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By

from core.views import ContactView
from core.models import Contact 
from core.forms import ContactForm, RegisterForm, LoginForm


def create_contact(name):
	name = u"%s" % name
	email = u"%s@gmail.com" % name
	subject = u"question from %s" % name
	message = u"message from %s" % name
	contact = Contact.objects.create(name=name, email=email, subject=subject, message=message)
	return contact


class FormTests(TestCase):

	fixtures = ['core_data.json']

	def setUp(self):
		self.myContact = create_contact("Aaron")
		self.aaron = User.objects.create_user('Aaron', 'pyaaron@gmail.com', '1234')
		self.inactive_user = User.objects.create_user('inactive_user', 'pyaaron@gmail.com', '1234')
		self.inactive_user.is_active = False
		self.inactive_user.save()

	def test_create(self):
		contact = Contact.objects.all()
		self.assertNotEqual(contact, None)

	def test_contact(self):
		name = u"Bob"
		name = u"%s" % name
		email = u"%s@gmail.com" % name
		subject = u"question from %s" % name
		message = u"message from %s" % name
		response = self.client.post('/contact/', {'name': name, 
												'email': email, 
												'subject': subject, 
												'message': message})
		self.assertEqual(response.status_code, 302)
		contacts = Contact.objects.all()
		self.assertEqual(len(contacts), 2)


# class MySeleniumTests(LiveServerTestCase):

# 	def setUp(self):
# 		self.browser = WebDriver()
# 		self.selenium_contact = create_contact("Adrian")
# 		self.yuki = User.objects.create_user('Yuki', 'pyaaron@gmail.com', '1234')
# 		self.aaron = User.objects.create_user('Aaron', 'pyaaron@gmail.com', '1234')

# 	def tearDown(self):
# 		self.browser.quit()

# 	def test_contact_form(self):
# 		contact = self.selenium_contact
# 		# user opens web browser, navigates to Contact page
# 		self.browser.get(self.live_server_url + '/contact/')
# 		body = self.browser.find_element_by_tag_name('body')
# 		self.assertIn('Contact Form', body.text)
# 		# input Form Data
# 		name_field = self.browser.find_element_by_name('name')
# 		name_field.send_keys(contact.name)
# 		email_field = self.browser.find_element_by_name('email')
# 		email_field.send_keys(contact.email)
# 		subject_field = self.browser.find_element_by_name('subject')
# 		subject_field.send_keys(contact.subject)
# 		message_field = self.browser.find_element_by_name('message')
# 		message_field.send_keys(contact.message)
# 		# Submit Form
# 		message_field.submit()
# 		# try:
# 		# 	# Wait for page to refresh
# 		# 	WebDriverWait(self.browser, 2).until(EC.presence_of_element_located((By.ID, "index_title")))
# 		# except:
# 		# 	pass
# 		# # Check that form was successfully submitted and now on Index page
# 		body = self.browser.find_element_by_tag_name('body')
# 		self.assertIn('Index Products', body.text)
# 		self.assertIn('Your contact email has been successfully sent.', body.text)

# 	def test_newsletter_form(self):
# 		contact = self.selenium_contact
# 		self.browser.get(self.live_server_url)
# 		body = self.browser.find_element_by_tag_name('body')
# 		self.assertIn('Index Products', body.text)
# 		# 1 - Real Email
# 		newsletter_field = self.browser.find_element_by_name('email')
# 		newsletter_field.send_keys(contact.email)
# 		newsletter_field.submit()
# 		body = self.browser.find_element_by_tag_name('body')
# 		self.assertIn('You have been added to our monthly newsletter.', body.text)
# 		# 2 - Blank Email
# 		self.browser.get(self.live_server_url)
# 		newsletter_field = self.browser.find_element_by_name('email')
# 		newsletter_field.send_keys(' ')
# 		newsletter_field.submit()
# 		body = self.browser.find_element_by_tag_name('body')
# 		self.assertIn('Enter a valid email address.', body.text)
# 		# 3 - Same Email - not accepted
# 		self.browser.get(self.live_server_url)
# 		newsletter_field = self.browser.find_element_by_name('email')
# 		newsletter_field.send_keys(contact.email)
# 		newsletter_field.submit()
# 		body = self.browser.find_element_by_tag_name('body')
# 		self.assertIn('Your email has already been added to the Newsletter.', body.text)

	def test_login(self):
		self.client.login(username='Yuki', password='1234')
		response = self.client.get(reverse('products:index'))
		self.assertContains(response, 'Logout')

	def test_logout(self):
		self.client.logout()
		response = self.client.get(reverse('products:index'))
		self.assertContains(response, 'Login')

# 	def test_login_flapsta_form(self):
# 		self.client.logout()
# 		contact = User.objects.get(username='Aaron')
# 		self.browser.get(self.live_server_url + '/login/flapsta/')
# 		body = self.browser.find_element_by_tag_name('body')
# 		self.assertIn('Login', body.text)
# 		username_field = self.browser.find_element_by_name('login_username')
# 		username_field.send_keys(contact.username)
# 		password_field = self.browser.find_element_by_name('login_password')
# 		password_field.send_keys(contact.password)
# 		self.browser.find_element_by_xpath('//input[@value="Login"]').click()
# 		try:
# 			# Wait for page to refresh
# 			WebDriverWait(self.browser, 2).until(EC.title_contains("Logout"))
# 		except:
# 			pass
# 		# get body, confirm logged in
# 		body = self.browser.find_element_by_tag_name('body')
# 		self.assertIn('Please check username', body.text)

# 	def test_register_form(self):
# 		self.browser.get(self.live_server_url + '/login/flapsta/')
# 		body = self.browser.find_element_by_tag_name('body')
# 		self.assertIn('Register', body.text)
# 		username_field = self.browser.find_element_by_name('register_username')
# 		username_field.send_keys('Test1')
# 		email_field = self.browser.find_element_by_name('register_email')
# 		email_field.send_keys('pyaaron@gmail.com')
# 		password_field = self.browser.find_element_by_name('register_password')
# 		password_field.send_keys('1234')
# 		self.browser.find_element_by_xpath('//input[@value="Register"]').click()
# 		# check email message
# 		try:
# 			# Wait for page to refresh
# 			WebDriverWait(self.browser, 2).until(EC.title_contains("login"))
# 		except:
# 			pass
# 		body = self.browser.find_element_by_tag_name('body')
# 		self.assertIn('Please check your email in order to activate your account.', body.text)

















