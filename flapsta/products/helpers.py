from django.template.loader import render_to_string

# from .models import Color, Idea

# product contrast choices
DARK = 'Dark'
LIGHT = 'Light'
CONTRAST_CHOICES = (
	(DARK, 'Dark'),
	(LIGHT, 'Light'),
	)

# Filters for Product List page ``dropdown``
portfolio_filters = {'title': 'Sort A-Z',
					'-our_rating': 'Best Match', 
					'-created': 'Newest',
					'sale_price': 'Price Lowest to Highest'}

# Product shuffler
# def shuffle_products():
# 	x = [[i] for i in Product.objects.all()]
# 	shuffle(x)
# 	products = []
# 	for ea in x:
# 		products.append(ea[0])
# 	return products