import random

from django.conf import settings
from django.core.mail import send_mail, EmailMessage
from django.core.mail import EmailMultiAlternatives
from django.template.loader import render_to_string


login_messages = {
	'no_match': 'Please check username and password',
	'no_register': 'Please use a valid username, email, and password',
	'not_active': "Your account hasn't been activated. Please check your email in order to activate your account.",
	'activate_via_email': 'Please check your email in order to activate your account.',
	'account_active': 'Your account has been successfully activated. Please Login.',
	'username_taken': 'Username already taken.'
}


def short_salt():
	ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	chars=[]
	for i in range(8):
		chars.append(random.choice(ALPHABET)) 
	return "".join(chars)


def salt():
	ALPHABET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
	chars=[]
	for i in range(16):
		chars.append(random.choice(ALPHABET)) 
	return "".join(chars)


def contact_email(name, email, subject, message):
	subject, from_email, to = 'Flapsta: Contact Email from {0}'.format(name), settings.DEFAULT_FROM_EMAIL, settings.DEFAULT_FROM_EMAIL
	text_content = 'Name: {0}; Email {1}; Subject {2}; Message {3}'.format(name, email, subject, message)
	html_content = render_to_string('core/html_contact_email.html', {'name':name, 'email':email, 'subject':subject, 'message':message})
	msg = EmailMultiAlternatives(subject, text_content, from_email, [to])
	msg.attach_alternative(html_content, "text/html")
	return msg 	


def signup_email(username, email, pk, signup_link):
	subject, from_email, to = 'Site Registration', settings.DEFAULT_FROM_EMAIL, email
	text_content = 'Click on link to finish registration'
	html_content = render_to_string('core/html_email.html', {'username': username, 'pk':pk, 'signup_link':signup_link})
	msg = EmailMultiAlternatives(subject, text_content, from_email, [to])
	msg.attach_alternative(html_content, "text/html")
	return msg 


def forgot_password_email(username, email, temp_password):
	subject, from_email, to = 'Temporary Password Reset', settings.DEFAULT_FROM_EMAIL, email
	text_content = 'Click on link to reset your password'
	html_content = render_to_string('core/password_reset_email.html', {'username': username, 'temp_password':temp_password})
	msg = EmailMultiAlternatives(subject, text_content, from_email, [to])
	msg.attach_alternative(html_content, "text/html")
	return msg 	

