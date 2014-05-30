from django.db.models import Manager


class IdeaManager(Manager):

	def idea_names(self):
		ideas = self.all()
		ideas_list = ""
		for idea in ideas:
			ideas_list += idea.name + " "
		return ideas_list.strip()

	def idea_one(self):
		ideas = self.idea_names().split()
		return ideas[0]

	def list_names(self):
		"""
		returns a list of Ideas with commas separating them
		for use in the product page 
		"""
		ideas = []
		for idea in self.all():
			ideas.append(idea.name)
		return ', '.join(ideas)

	def all_available(self):
		return self.filter(available=True)


class ProductManager(Manager): 

	def list_names(self):
		products = []
		for product in self.all():
			products.append(product.title)
		return ', '.join(products)

	def all_available(self):
		return self.filter(available=True)


class ColorManager(Manager):

	def list_names(self):
		colors = []
		for color in self.all():
			colors.append(color.name)
		return ', '.join(colors)


class StarManager(Manager):

	def user_voted(self, user_id, product_id):
		vote = self.filter(user_id=user_id, product_id=product_id)
		if vote is not None:
			return True
		else:
			return False











