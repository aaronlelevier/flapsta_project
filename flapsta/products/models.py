import datetime
import random

from django.db import models
from django.contrib.auth.models import User
from django.forms import Textarea
from django.core.validators import MaxLengthValidator
from django.utils import timezone
from django.template.defaultfilters import slugify
from django.core.urlresolvers import reverse
from django.utils.translation import ugettext, ugettext_lazy as _
from django.core.validators import MaxValueValidator, MinValueValidator

from .helpers import CONTRAST_CHOICES
from .managers import IdeaManager, StarManager, ProductManager, ColorManager


def mark_as_non_default_idea():
	ideas = Idea.objects.all()
	for idea in ideas:
		idea.default = False
		idea.save()
	return ideas


def product_image_file(instance, filename):
	return '/'.join(['product_pictures', filename])


def idea_image_file(instance, filename):
	return '/'.join(['idea_pictures', filename])


class AbstractFeature(models.Model):
	"""
	Abstract base model for Product M2M features
	"""
	name = models.CharField(_("Name"), max_length=25)
	slug = models.SlugField(_("Slug"), max_length=30, blank=True)

	class Meta:
		abstract = True

	def __unicode__(self):
		return self.name 

	def save(self, *args, **kwargs):
		self.slug = slugify(self.name)
		super(AbstractFeature, self).save(*args, **kwargs)


class Color(AbstractFeature):
	
	objects = ColorManager()


class Product(models.Model):
	# Joins
	# designer = models.ForeignKey("Designer", blank=True, verbose_name=_("Designers"))
	ideas = models.ManyToManyField("Idea", blank=True, verbose_name=_("Ideas")) 
	colors = models.ManyToManyField("Color", blank=True, verbose_name=_("Colors"))
	related_products = models.ManyToManyField("self", verbose_name=_("Related products"), blank=True)
	# Fields
	title = models.CharField(_("Title"), max_length=50)
	developed_for = models.CharField(_("Developed For"), max_length=50, blank=True)
	description = models.TextField(_("Description"), max_length=500, null=True, blank=True)
	image_one = models.ImageField(_("Image One"), upload_to=product_image_file, 
								help_text="Must Add at least one Image here", null=True, blank=True)
	image_two = models.ImageField(_("Image Two"), upload_to=product_image_file, null=True, blank=True)
	image_three = models.ImageField(_("Image Three"), upload_to=product_image_file, null=True, blank=True)
	unit_price = models.FloatField(_("Price"), null=True, blank=True)
	sale_price = models.FloatField(_("Sale Price"), null=True, blank=True)
	SKU = models.CharField(_("SKU"), max_length=25, null=True, blank=True)
	UPC = models.CharField(_("UPC"), max_length=25, null=True, blank=True)
	ASIN = models.CharField(_("ASIN"), max_length=25, null=True, blank=True)
	contrast = models.CharField(_("Contrast"), max_length=25, choices=CONTRAST_CHOICES, blank=True)
	our_rating = models.IntegerField(_("Our Rating"), default=1,
								validators=[MaxValueValidator(10), MinValueValidator(1)])
	# Bool Tags
	available = models.BooleanField(_("Available"), default=True,
									help_text="Uncheck box to show as unavailable")
	main_art = models.BooleanField(_("Main Art"), default=False)
	featured = models.BooleanField(_("Featured"), default=False)
	# Auto Fields
	slug = models.CharField(_("Slug"), max_length=60, blank=True)
	idea_one = models.SlugField(_("Idea One"), max_length=60, blank=True)
	created = models.DateTimeField(auto_now_add=True)
	modified = models.DateTimeField(auto_now=True)

	objects = ProductManager()

	def __unicode__(self):
		return self.title

	def save(self, *args, **kwargs):
		self.slug = slugify(self.title)
		super(Product, self).save(*args, **kwargs)

	class Meta:
		verbose_name = _("Product")
		verbose_name_plural = _("products")
		ordering = ("title",)

	def get_absolute_url(self):
		return reverse('products:product', kwargs={'slug':self.slug})

	def current_price(self):
		if self.sale_price is not None and self.sale_price < self.unit_price:
			return self.sale_price
		else:
			return self.unit_price

	def get_votes(self):
		return Star.objects.filter(product_id=self.id).count()

	def on_sale(self):
		if self.sale_price is not None and self.sale_price < self.unit_price:
			return True
		else:
			return False

	def price(self):
		if self.sale_price is not None and self.sale_price < self.unit_price:
			return self.sale_price
		else:
			return self.unit_price

	def has_votes(self):
		votes = Star.objects.filter(product_id=self.id).count()
		if votes > 0:
			return True
		else:
			return False

	def votes(self):
		return Star.objects.filter(product_id=self.id).count()


class Star(models.Model):
	"""
	Tracks votes for a given Product
	Makes sure that each user can only vote once per Product
	Denormalized to increase speed of db lookup
	"""
	vote = models.IntegerField(blank=True, default=1)
	user_id = models.IntegerField()
	product_id = models.IntegerField()

	objects = StarManager()

	def __unicode__(self):
		product = Product.objects.get(id=self.product_id)
		user = User.objects.get(id=self.user_id)
		return 'UserID:' + str(self.user_id) + ' - ' + user.username +  ' | ' + 'ProductID:' + str(self.product_id) + ' - ' + product.title


class Idea(AbstractFeature):

	# unique fields not inherited from AbstractFeature
	available = models.BooleanField(_("Available"), default=True,
									help_text="Uncheck box to show as unavailable")
	description = models.TextField(_("Description"), max_length=2000)
	image = models.ImageField(_("Idea Image"), upload_to=idea_image_file, null=True, blank=True)
	# only one ``default`` idea per the portfolio page
	default = models.BooleanField(blank=True, default=False)

	objects = IdeaManager()

	def save(self, *args, **kwargs):
		# make sure there's only one default Idea
		if self.default == True:
			ideas = mark_as_non_default_idea()
			self.default = True
		super(Idea, self).save(*args, **kwargs)

	class Meta:
		verbose_name = _("Idea")
		verbose_name_plural = _("Ideas")
		ordering = ("-default",)

	def get_absolute_url(self):
		return reverse('products:idea', kwargs={'slug':self.slug})








