# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Deleting model 'Tag'
        db.delete_table(u'products_tag')

        # Deleting model 'IdeaDescriptor'
        db.delete_table(u'products_ideadescriptor')

        # Deleting model 'Style'
        db.delete_table(u'products_style')

        # Removing M2M table for field styles on 'Product'
        db.delete_table(db.shorten_name(u'products_product_styles'))

        # Removing M2M table for field tags on 'Product'
        db.delete_table(db.shorten_name(u'products_product_tags'))

        # Deleting field 'Idea.first_paragraph'
        db.delete_column(u'products_idea', 'first_paragraph')

        # Deleting field 'Idea.second_paragraph'
        db.delete_column(u'products_idea', 'second_paragraph')

        # Adding field 'Idea.description'
        db.add_column(u'products_idea', 'description',
                      self.gf('django.db.models.fields.TextField')(default=1, max_length=2000),
                      keep_default=False)

        # Removing M2M table for field descriptors on 'Idea'
        db.delete_table(db.shorten_name(u'products_idea_descriptors'))


    def backwards(self, orm):
        # Adding model 'Tag'
        db.create_table(u'products_tag', (
            ('slug', self.gf('django.db.models.fields.SlugField')(max_length=30, blank=True)),
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=25)),
        ))
        db.send_create_signal(u'products', ['Tag'])

        # Adding model 'IdeaDescriptor'
        db.create_table(u'products_ideadescriptor', (
            ('slug', self.gf('django.db.models.fields.SlugField')(max_length=30, blank=True)),
            ('description', self.gf('django.db.models.fields.CharField')(max_length=1000, null=True, blank=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=25)),
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
        ))
        db.send_create_signal(u'products', ['IdeaDescriptor'])

        # Adding model 'Style'
        db.create_table(u'products_style', (
            ('slug', self.gf('django.db.models.fields.SlugField')(max_length=30, blank=True)),
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=25)),
        ))
        db.send_create_signal(u'products', ['Style'])

        # Adding M2M table for field styles on 'Product'
        m2m_table_name = db.shorten_name(u'products_product_styles')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('product', models.ForeignKey(orm[u'products.product'], null=False)),
            ('style', models.ForeignKey(orm[u'products.style'], null=False))
        ))
        db.create_unique(m2m_table_name, ['product_id', 'style_id'])

        # Adding M2M table for field tags on 'Product'
        m2m_table_name = db.shorten_name(u'products_product_tags')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('product', models.ForeignKey(orm[u'products.product'], null=False)),
            ('tag', models.ForeignKey(orm[u'products.tag'], null=False))
        ))
        db.create_unique(m2m_table_name, ['product_id', 'tag_id'])

        # Adding field 'Idea.first_paragraph'
        db.add_column(u'products_idea', 'first_paragraph',
                      self.gf('django.db.models.fields.TextField')(default=1, max_length=2000),
                      keep_default=False)

        # Adding field 'Idea.second_paragraph'
        db.add_column(u'products_idea', 'second_paragraph',
                      self.gf('django.db.models.fields.TextField')(default=1, max_length=2000),
                      keep_default=False)

        # Deleting field 'Idea.description'
        db.delete_column(u'products_idea', 'description')

        # Adding M2M table for field descriptors on 'Idea'
        m2m_table_name = db.shorten_name(u'products_idea_descriptors')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('idea', models.ForeignKey(orm[u'products.idea'], null=False)),
            ('ideadescriptor', models.ForeignKey(orm[u'products.ideadescriptor'], null=False))
        ))
        db.create_unique(m2m_table_name, ['idea_id', 'ideadescriptor_id'])


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
            'description': ('django.db.models.fields.TextField', [], {'max_length': '2000'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('django.db.models.fields.files.ImageField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
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
            'related_products': ('django.db.models.fields.related.ManyToManyField', [], {'related_name': "'related_products_rel_+'", 'blank': 'True', 'to': u"orm['products.Product']"}),
            'sale_price': ('django.db.models.fields.FloatField', [], {'null': 'True', 'blank': 'True'}),
            'slug': ('django.db.models.fields.CharField', [], {'max_length': '60', 'blank': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'unit_price': ('django.db.models.fields.FloatField', [], {'null': 'True', 'blank': 'True'})
        },
        u'products.star': {
            'Meta': {'object_name': 'Star'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'product_id': ('django.db.models.fields.IntegerField', [], {}),
            'user_id': ('django.db.models.fields.IntegerField', [], {}),
            'vote': ('django.db.models.fields.IntegerField', [], {'default': '1', 'blank': 'True'})
        }
    }

    complete_apps = ['products']