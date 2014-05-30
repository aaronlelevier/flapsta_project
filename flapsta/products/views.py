import operator
from random import randrange, shuffle

from django.contrib import auth 
from django.conf import settings
from django.http import HttpResponse, Http404, HttpResponseRedirect
from django.template import Template, Context, RequestContext, loader
from django.core.urlresolvers import reverse, reverse_lazy
from django.template.loader import get_template
from django.shortcuts import render, get_object_or_404, render_to_response
from django.views.generic import ListView
from django.views.generic.base import TemplateView, RedirectView
from django.views.generic.edit import FormView, CreateView, UpdateView, DeleteView
from django.views.generic.detail import DetailView
from django.contrib.auth.models import User 
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.contrib import messages
from django.contrib.auth.decorators import login_required, permission_required
from django.utils.decorators import method_decorator

from django.core.paginator import Paginator, EmptyPage, InvalidPage
from django.template import RequestContext

from braces.views import LoginRequiredMixin, PermissionRequiredMixin

from .models import Product, Color, Idea, Star
from .helpers import portfolio_filters
from core.models import Newsletter
from core.forms import NewsletterForm


class BaseTemplateView(TemplateView):
	""" 
	Abstract View to populate NavBar context
	"""
	def get_context_data(self, **kwargs):
		context = super(BaseTemplateView, self).get_context_data(**kwargs)
		context['ideas'] = Idea.objects.all()
		context['portfolio_filters'] = portfolio_filters
		return context


class IndexView(FormView):

	template_name = 'products/index-basic.html'
	form_class = NewsletterForm
	success_url = reverse_lazy('products:index')

	def form_valid(self, form):
		cd = form.cleaned_data
		check = Newsletter.objects.filter(email=cd['email']).exists()
		if check:
			msg = 'Your email has already been added to the Newsletter.'
			messages.info(self.request, msg)
		else:
			email = Newsletter.objects.create(email=cd['email'])
			msg = 'You have been added to our monthly newsletter.'
			messages.info(self.request, msg)
		return super(IndexView, self).form_valid(form)	

	def form_invalid(self, form):
		response = super(IndexView, self).form_invalid(form)
		msg = 'Enter a valid email address.'
		messages.info(self.request, msg)
		return response

	def get_context_data(self, **kwargs):
		context = super(IndexView, self).get_context_data(**kwargs)
		context['ideas'] = Idea.objects.all()
		# shuffle 12 products shown on home page
		x = [[i] for i in Product.objects.all()]
		shuffle(x)
		featured_products = []
		for ea in x:
			featured_products.append(ea[0])
		context['featured_products'] = featured_products[:12]
		# cont
		context['portfolio_filters'] = portfolio_filters
		context['design_count'] = Product.objects.count()
		# recommended product
		total_products = Product.objects.count()
		product_pk = randrange(1, total_products)
		try:
			recommended_product = Product.objects.all()[product_pk]
		except:
			recommended_product = Product.objects.all()[0]
		context['recommended_product'] = recommended_product 
		return context


class PortfolioView(BaseTemplateView):

	template_name = 'products/shop-full-width.html'
	products_list = Product.objects.all()
	paginator = Paginator(products_list, 12)

	def get(self, request):
		ideas = Idea.objects.all()
		try:
			page = int(request.GET.get('page', '1'))
		except:
			page = 1

		try:
			products = self.paginator.page(page)
		except(EmptyPage, InvalidPage):
			products = self.paginator.page(self.paginator.num_pages)

		return render_to_response(self.template_name,
			{'ideas': ideas, 'products': products, 
			'portfolio_filters': portfolio_filters},
			context_instance=RequestContext(request))


def ProductSearchView(request):

	template_name = 'products/shop-full-width.html'
	q = request.GET.get('q')
	products_list = Product.objects.filter(title__icontains=q)
	paginator = Paginator(products_list, 12)
	ideas = Idea.objects.all()

	try:
		page = int(request.GET.get('page', '1'))
	except:
		page = 1

	try:
		products = paginator.page(page)
	except(EmptyPage, InvalidPage):
		products = paginator.page(paginator.num_pages)

	return render_to_response(template_name,
		{'ideas': ideas, 'products': products,
		'portfolio_filters': portfolio_filters},
		context_instance=RequestContext(request))


def portfolio_filtered(request, slug):

	template_name = 'products/shop-full-width.html'
	products_list = Product.objects.order_by(slug)
	paginator = Paginator(products_list, 12)
	ideas = Idea.objects.all()

	try:
		page = int(request.GET.get('page', '1'))
	except:
		page = 1

	try:
		products = paginator.page(page)
	except(EmptyPage, InvalidPage):
		products = paginator.page(paginator.num_pages)

	return render_to_response(template_name,
		{'ideas': ideas, 'products': products,
		'portfolio_filters': portfolio_filters, 'slug': slug},
		context_instance=RequestContext(request))


class IdeaView(BaseTemplateView):

	template_name = 'products/shop-full-width.html'

	def get(self, request, *args, **kwargs):
		ideas = Idea.objects.all()
		idea = get_object_or_404(Idea, slug=kwargs['slug'])
		products = Product.objects.filter(ideas=idea)
		products_list = products
		paginator = Paginator(products_list, 12)
		try:
			page = int(request.GET.get('page', '1'))
		except:
			page = 1

		try:
			products = paginator.page(page)
		except(EmptyPage, InvalidPage):
			products = paginator.page(paginator.num_pages)

		return render_to_response(self.template_name,
			{'ideas': ideas, 'idea': idea, 'products': products,
			'portfolio_filters': portfolio_filters},
			context_instance=RequestContext(request))


class ProductView(BaseTemplateView):
	"""
	Has a ``Same Category`` product list view of 3 products
	Has ``Random Picks`` at the bottom (no dupes)
	"""
	template_name = 'products/shop-product-sidebar.html'

	def get_context_data(self, **kwargs):
		context = super(ProductView, self).get_context_data(**kwargs) 
		product = get_object_or_404(Product, slug=kwargs['slug'])
		context['product'] = product
		color = product.colors.all()[0]
		# Error proof getting the number of colors in the same group 
		#	as this product
		color_matches = len(Product.objects.filter(colors=color).exclude(id=product.id))
		if color_matches >= 3:
			color_matches = 3
		# filter for other products with matching colors
		color_products = Product.objects.filter(colors=color).exclude(id=product.id)[:color_matches]
		context['color_products'] = color_products
		idea = product.ideas.all()[0]
		# Error proof related Products by Idea just like Color Products
		idea_matches = len(Product.objects.filter(ideas=idea).exclude(
			id=product.id).exclude(
			pk__in=[o.pk for o in color_products])
			)
		if idea_matches >= 4:
			idea_matches = 4
		# Get idea_matches
		context['idea_products'] = Product.objects.filter(ideas=idea).exclude(
			id=product.id).exclude(
			pk__in=[o.pk for o in color_products])[:idea_matches]
		# Votes Logic
		context['user_voted'] = Star.objects.user_voted(user_id=self.request.user.id, product_id=product.id)
		print context['user_voted']
		return context


class HowToApplyView(BaseTemplateView):

	template_name = 'products/how_to_apply-new.html'


class FeaturesView(BaseTemplateView):

	template_name = 'products/features-new.html'


class RecommendedProductView(ProductView):

	def get(self, request, *args, **kwargs):
		messages.warning(self.request, 'We have a feeling that you will like this case!')
		return super(RecommendedProductView, self).get(request, *args, **kwargs)


@login_required(login_url=reverse_lazy('core:login_flapsta'))
def vote_for_product(request, slug):
	product = get_object_or_404(Product, slug=slug)
	vote = Star.objects.create(user_id=request.user.id, product_id=product.id)
	return HttpResponseRedirect(reverse('products:product', kwargs={'slug': slug}))







