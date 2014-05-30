# README #

Flapsta.com repo

### Overview - Of the project setup ###

* **virtualenv** - use for a separate python environment for each project
* **pip install** - to install most 3rd party libraries
* **requirements.txt** - to list all 3rd party apps used
* **.sql** - sometimes I will do a sql dump at certain steps in a project for version control
* **project layout** - try to set up the directory hierarchy in a logical fashion with readable names


### Overview of features ###

* core app for user logins and product app for the products
* normal user logins as well as social logins using OAuth and the 3rd party app [django-social-auth](https://github.com/omab/django-social-auth). Social Auth configurations are in the settings.py. 
* **Product ratings** - created the ability to give a product a 'star' if one likes the product. This is on the product detail page of each product. Created this feature, so the user must be signed in, and can only star a product once
* **twitter feed** - configured a third party app called [django-twitter-tag](https://github.com/coagulant/django-twitter-tag) for a twitter feed of that shows on the footer page.
* **pagination** - the site has several different types of pagination. All of these product pagination views would be under /flapsta/products/views.py 
    * PortfolioView:  pagination for all products
    * portfolio_filtered: by category, so flowers, hearts, skulls, etc... 
    * portfolio_filtered: for A-Z, Best Match and so on. 
    * ProductSearchView: pagination for search if the search results are beyond one product list page
* **tests** - there is a test directory under each app. The tests are spread out, but I also used Selenium for some in browser testing. The Selenium tests are in /flapsta/products/tests/test_views.py SeleniumViewTests.


### Other project notes that I think you may find interesting ###
* When working with the owner of Flapsta, some interesting parts of the project were:
    * The image files were too large for the web page, so in order to compress them all, and, for the page to run fast, I built a simple script using PIL to do so.  This is in /flapsta/products/my_data.py 'resize_images'.  In my_data.py there are also some other utility functions that I used.
    * Output the inventory sku's from Amazon's product page of Flapsta, so these are saved in the database, and then added to the links on the product detail page to transfer the customer to Amazon if they decide to purchase
* **product detail page** - there are other phone cases on each product detail page for cross selling, so I built this page to show products of the same category on the bottom and similar color products on the right. And with that, built exclusion logic so no products would show in more than one group, and the main product of the product detail page is also excluded
* **home page random products** - the owner of Flapsta wanted the products on the home page to show up randomly, so if people revisit the site, they would be seeing different products. So built a random function for the home page products to display
