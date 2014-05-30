import os, os.path
from random import randrange, shuffle
from PIL import Image

from unipath import Path 


from products.models import Product, Color, Idea
from products.product_list import color_list, idea_list, products_only_list, ideas_n_products_list, color_list_products


COLORS = color_list
IDEAS = idea_list
PRODUCTS = products_only_list
IDEA_N_PRODUCTS = ideas_n_products_list
COLORS_N_PRODUCTS = color_list_products


def update_sku():
	"""
	name in [1]
	sku, upc, aisn in [4'5'6]
	"""
	filename = "/Users/Yuki_Aaron/Documents/djcode/flapsta_project/flapsta/flapsta_sku.txt"
	infile = open(filename, "r")
 
	# skip first line
	infile.readline()
 
	# now look for each item.  Where there is a match, save new info
	#	else print name to fix after
	for line in infile:
		eaLine = line.split(',')
		# try to find
		try:
			prod = Product.objects.get(title__icontains=eaLine[1].strip())
			prod.SKU = eaLine[3]
			prod.UPC = eaLine[4]
			prod.ASIN = eaLine[5]
			prod.save()
		except:
			print eaLine
 
	infile.close()


def resize_one_image(name):
	try:
		name = name.strip()
		fp = open("/Users/Yuki_Aaron/Documents/djcode/flapsta_project/"
				"flapsta/static/img/slides/" + name + ".jpg", "rb")
		img = Image.open(fp)
		img.load()
		img.save("/Users/Yuki_Aaron/Documents/djcode/flapsta_project/"
				"flapsta/static/img/slides/" + name + "_2" + ".jpg", quality=100)
		fp.close()
	except:
		print name 


def new_arrivals():
	x = [[i] for i in Product.objects.all()]
	shuffle(x)
	featured_products = []
	for ea in x:
		featured_products.append(ea[0])
	new_products = featured_products[:12]
	# add to "New Arrivals"
	idea = Idea.objects.get(name='New Arrivals')
	for prod in new_products:
		prod.ideas.add(idea)
		prod.save()


class CreateTestData(object):

	def __init__(self):
		pass 

	def create(self):

		# Create Colors
		colors = COLORS
		for color in colors:
			try:
				item = Color.objects.get(name=color)
				print item.name
			except:
				Color.objects.create(name=color)

		# Create Ideas
		ideas = IDEAS
		for idea in ideas:
			n = randrange(1,5)
			try:
				item = Idea.objects.get(name=idea)
				print item.name
			except:
				new_idea = Idea.objects.create(name=idea,
									available=True,
									description="Globally incubate standards compliant channels before scalable benefits. Quickly disseminate superior deliverables whereas web-enabled applications. Quickly drive clicks-and-mortar catalysts for change before vertical architectures.",
									image="product_pictures/iPhone"+str(n)+".jpg")
		# Create Products
		products = PRODUCTS
		i = 1
		for product in products:
			try:
				item = Product.objects.get(title=product)
				print item.title
			except:
				n = randrange(1,5)
				n2 = randrange(1,5)
				n3 = randrange(1,5)
				title = product
				developed_for = "Made For Me"
				product_name = "name%s" % i 
				product_name = Product.objects.create(title=title, 
													available=True,
													developed_for=developed_for,
													unit_price=25.00,
													sale_price=20.00,
													image_one="product_pictures/iPhone"+str(n)+".jpg",
													main_art=True,
													featured=True)
			i += 1

	def add_ideas(self):
		# add Idea to each Product in list
		ideas_n_products = IDEA_N_PRODUCTS
		for idea, product in ideas_n_products:
			try:
				prod = Product.objects.get(title=product)
				idea = Idea.objects.get(name=idea)
				prod.ideas.add(idea)
				prod.save()
			except:
				pass

	def add_idea_one(self):
		# For each product, get their first Idea, and make it ``idea_one``
		products = PRODUCTS
		for product in products:
			prod = Product.objects.get(title=product)
			try:
				idea = prod.ideas.all()[0]
				prod.idea_one = idea.name
				prod.save()
			except:
				prod.idea_one = IDEAS[0]
				prod.save()

	def add_colors(self):
		colors_n_products = COLORS_N_PRODUCTS
		for c, p in colors_n_products:
			try:
				color = Color.objects.get(name=c)
				product = Product.objects.get(title=p)
				product.colors.add(color)
				product.save()
			except:
				pass	

	def add_pictures(self):
		"""
		Try / Except - to save all pictures for their matching name.
		If unsuccessful, print the product name to go back and fix
		"""
		products = PRODUCTS
		for product in products:
			prod = Product.objects.get(title=product)
			try:
				prod.title = prod.title.strip()
				prod.image_one = "product_pictures/" + prod.title + "_2" + '.jpg'
				prod.save()
			except:
				print prod.title

	def resize_images(self):
		products = PRODUCTS
		for name in products:
			try:
				name = name.strip()
				fp = open("/Users/Yuki_Aaron/Documents/djcode/flapsta_project/"
						"flapsta/media/product_pictures/" + name + ".jpg", "rb")
				img = Image.open(fp)
				img.load()
				img.save("/Users/Yuki_Aaron/Documents/djcode/flapsta_project/"
						"flapsta/media/product_pictures/" + name + "_2" + ".jpg", quality=23)
				fp.close()
			except:
				print name 


	def resize_one(self):
		try:
			fp = open("/Users/Yuki_Aaron/Documents/djcode/flapsta_project/"
					"flapsta/media/photo_shoot/" + "p-5" + ".jpg", "rb")
			img = Image.open(fp)
			img.load()
			img.save("/Users/Yuki_Aaron/Documents/djcode/flapsta_project/"
					"flapsta/media/product_pictures/" + "p-5" + "_2" + ".jpg", quality=23)
			fp.close()
		except:
			print 'fail' 
	
	# remove all data
	def delete(self):
		obj_list = [Product, Idea, Color]
		for obj in obj_list:
			items = obj.objects.all()
			for i in range(len(items)):
				items[i].delete()
			result = obj.objects.all()
			print result











