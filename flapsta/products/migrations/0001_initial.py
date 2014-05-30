# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Style'
        db.create_table(u'products_style', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=25)),
            ('slug', self.gf('django.db.models.fields.SlugField')(max_length=30, blank=True)),
        ))
        db.send_create_signal(u'products', ['Style'])

        # Adding model 'Color'
        db.create_table(u'products_color', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=25)),
            ('slug', self.gf('django.db.models.fields.SlugField')(max_length=30, blank=True)),
        ))
        db.send_create_signal(u'products', ['Color'])

        # Adding model 'Product'
        db.create_table(u'products_product', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('developed_for', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('description', self.gf('django.db.models.fields.TextField')(max_length=500, null=True, blank=True)),
            ('image_one', self.gf('django.db.models.fields.files.ImageField')(max_length=100)),
            ('image_two', self.gf('django.db.models.fields.files.ImageField')(max_length=100, null=True, blank=True)),
            ('image_three', self.gf('django.db.models.fields.files.ImageField')(max_length=100, null=True, blank=True)),
            ('unit_price', self.gf('django.db.models.fields.FloatField')(null=True, blank=True)),
            ('sale_price', self.gf('django.db.models.fields.FloatField')(null=True, blank=True)),
            ('contrast', self.gf('django.db.models.fields.CharField')(max_length=25, blank=True)),
            ('main_art', self.gf('django.db.models.fields.BooleanField')(default=False)),
            ('featured', self.gf('django.db.models.fields.BooleanField')(default=False)),
            ('slug', self.gf('django.db.models.fields.CharField')(max_length=60, blank=True)),
            ('idea_one', self.gf('django.db.models.fields.SlugField')(max_length=60, blank=True)),
            ('created', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('modified', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
        ))
        db.send_create_signal(u'products', ['Product'])

        # Adding M2M table for field ideas on 'Product'
        m2m_table_name = db.shorten_name(u'products_product_ideas')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('product', models.ForeignKey(orm[u'products.product'], null=False)),
            ('idea', models.ForeignKey(orm[u'products.idea'], null=False))
        ))
        db.create_unique(m2m_table_name, ['product_id', 'idea_id'])

        # Adding M2M table for field colors on 'Product'
        m2m_table_name = db.shorten_name(u'products_product_colors')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('product', models.ForeignKey(orm[u'products.product'], null=False)),
            ('color', models.ForeignKey(orm[u'products.color'], null=False))
        ))
        db.create_unique(m2m_table_name, ['product_id', 'color_id'])

        # Adding M2M table for field styles on 'Product'
        m2m_table_name = db.shorten_name(u'products_product_styles')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('product', models.ForeignKey(orm[u'products.product'], null=False)),
            ('style', models.ForeignKey(orm[u'products.style'], null=False))
        ))
        db.create_unique(m2m_table_name, ['product_id', 'style_id'])

        # Adding model 'IdeaDescriptor'
        db.create_table(u'products_ideadescriptor', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=25)),
            ('slug', self.gf('django.db.models.fields.SlugField')(max_length=30, blank=True)),
            ('description', self.gf('django.db.models.fields.CharField')(max_length=1000, null=True, blank=True)),
        ))
        db.send_create_signal(u'products', ['IdeaDescriptor'])

        # Adding model 'Idea'
        db.create_table(u'products_idea', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=25)),
            ('slug', self.gf('django.db.models.fields.SlugField')(max_length=30, blank=True)),
            ('first_paragraph', self.gf('django.db.models.fields.CharField')(max_length=2000)),
            ('second_paragraph', self.gf('django.db.models.fields.CharField')(max_length=2000)),
            ('image', self.gf('django.db.models.fields.files.ImageField')(max_length=100, null=True, blank=True)),
            ('default', self.gf('django.db.models.fields.BooleanField')(default=False)),
        ))
        db.send_create_signal(u'products', ['Idea'])

        # Adding M2M table for field products on 'Idea'
        m2m_table_name = db.shorten_name(u'products_idea_products')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('idea', models.ForeignKey(orm[u'products.idea'], null=False)),
            ('product', models.ForeignKey(orm[u'products.product'], null=False))
        ))
        db.create_unique(m2m_table_name, ['idea_id', 'product_id'])

        # Adding M2M table for field descriptors on 'Idea'
        m2m_table_name = db.shorten_name(u'products_idea_descriptors')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('idea', models.ForeignKey(orm[u'products.idea'], null=False)),
            ('ideadescriptor', models.ForeignKey(orm[u'products.ideadescriptor'], null=False))
        ))
        db.create_unique(m2m_table_name, ['idea_id', 'ideadescriptor_id'])


    def backwards(self, orm):
        # Deleting model 'Style'
        db.delete_table(u'products_style')

        # Deleting model 'Color'
        db.delete_table(u'products_color')

        # Deleting model 'Product'
        db.delete_table(u'products_product')

        # Removing M2M table for field ideas on 'Product'
        db.delete_table(db.shorten_name(u'products_product_ideas'))

        # Removing M2M table for field colors on 'Product'
        db.delete_table(db.shorten_name(u'products_product_colors'))

        # Removing M2M table for field styles on 'Product'
        db.delete_table(db.shorten_name(u'products_product_styles'))

        # Deleting model 'IdeaDescriptor'
        db.delete_table(u'products_ideadescriptor')

        # Deleting model 'Idea'
        db.delete_table(u'products_idea')

        # Removing M2M table for field products on 'Idea'
        db.delete_table(db.shorten_name(u'products_idea_products'))

        # Removing M2M table for field descriptors on 'Idea'
        db.delete_table(db.shorten_name(u'products_idea_descriptors'))


    models = {
        u'products.color': {
            'Meta': {'object_name': 'Color'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '25'}),
            'slug': ('django.db.models.fields.SlugField', [], {'max_length': '30', 'blank': 'True'})
        },
        u'products.idea': {
            'Meta': {'ordering': "('-default',)", 'object_name': 'Idea'},
            'default': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'descriptors': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['products.IdeaDescriptor']", 'symmetrical': 'False', 'blank': 'True'}),
            'first_paragraph': ('django.db.models.fields.CharField', [], {'max_length': '2000'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('django.db.models.fields.files.ImageField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '25'}),
            'products': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['products.Product']", 'symmetrical': 'False', 'blank': 'True'}),
            'second_paragraph': ('django.db.models.fields.CharField', [], {'max_length': '2000'}),
            'slug': ('django.db.models.fields.SlugField', [], {'max_length': '30', 'blank': 'True'})
        },
        u'products.ideadescriptor': {
            'Meta': {'object_name': 'IdeaDescriptor'},
            'description': ('django.db.models.fields.CharField', [], {'max_length': '1000', 'null': 'True', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '25'}),
            'slug': ('django.db.models.fields.SlugField', [], {'max_length': '30', 'blank': 'True'})
        },
        u'products.product': {
            'Meta': {'ordering': "('-created',)", 'object_name': 'Product'},
            'colors': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['products.Color']", 'symmetrical': 'False', 'blank': 'True'}),
            'contrast': ('django.db.models.fields.CharField', [], {'max_length': '25', 'blank': 'True'}),
            'created': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'description': ('django.db.models.fields.TextField', [], {'max_length': '500', 'null': 'True', 'blank': 'True'}),
            'developed_for': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'featured': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'idea_one': ('django.db.models.fields.SlugField', [], {'max_length': '60', 'blank': 'True'}),
            'ideas': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['products.Idea']", 'symmetrical': 'False', 'blank': 'True'}),
            'image_one': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'image_three': ('django.db.models.fields.files.ImageField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'image_two': ('django.db.models.fields.files.ImageField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'main_art': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'modified': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'sale_price': ('django.db.models.fields.FloatField', [], {'null': 'True', 'blank': 'True'}),
            'slug': ('django.db.models.fields.CharField', [], {'max_length': '60', 'blank': 'True'}),
            'styles': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['products.Style']", 'symmetrical': 'False', 'blank': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'unit_price': ('django.db.models.fields.FloatField', [], {'null': 'True', 'blank': 'True'})
        },
        u'products.style': {
            'Meta': {'object_name': 'Style'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '25'}),
            'slug': ('django.db.models.fields.SlugField', [], {'max_length': '30', 'blank': 'True'})
        }
    }

    complete_apps = ['products']