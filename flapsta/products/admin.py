from django import forms
from django.contrib import admin
from django.db import models
from django.forms import TextInput, Textarea

from .models import Product, Color, Idea, Star


class ColorAdmin(admin.ModelAdmin):
	readonly_fields = ('slug',)
	fieldsets = [
		('Info', 					{'fields': ['name']}),
		('Auto Fields', 			{'fields': ['slug']}),
	]


class ProductAdmin(admin.ModelAdmin):
	search_fields = ['title']
	list_display = ('title', 'developed_for', 'main_art', 'featured', 'created',)
	readonly_fields = ('created', 'modified', 'slug', 'idea_one',)
	filter_horizontal = ('ideas', 'colors', 'related_products')
	fieldsets = [ 
		('Available',				{'fields': ['available']}),
		('Featured Product', 		{'fields': ['main_art', 'featured']}),
		('Codes',					{'fields': ['SKU', 'UPC', 'ASIN']}),
		('Product Info', 			{'fields': ['title', 'developed_for', 'description', 'unit_price', 
										'sale_price', 'contrast']}), 
		('Images',					{'fields': ['image_one', 'image_two', 'image_three']}),
		('Ideas',	 				{'fields': ['ideas']}), 
		('Product Variations', 	 	{'fields': ['colors']}),
		('Related Products',	 	{'fields': ['related_products']}), 
		('Auto Fields', 			{'fields': ['created', 'modified', 'slug', 'idea_one']}),
	]


class IdeaAdmin(admin.ModelAdmin):
	readonly_fields = ('slug',)
	fieldsets = [
		('Info', 					{'fields': ['available', 'default', 'name', 'description',
										'image']}),
		('Auto Fields', 			{'fields': ['slug']}),
	]

class StarAdmin(admin.ModelAdmin):
	readonly_fields = ('user_id',)
	fieldsets = [
		('Info', 		{'fields': ['user_id', 'product_id', 'vote']})
	]


admin.site.register(Color, ColorAdmin)
admin.site.register(Product, ProductAdmin)
admin.site.register(Idea, IdeaAdmin)
admin.site.register(Star, StarAdmin)
