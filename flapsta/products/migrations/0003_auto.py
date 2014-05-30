# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding M2M table for field related_products on 'Product'
        m2m_table_name = db.shorten_name(u'products_product_related_products')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('from_product', models.ForeignKey(orm[u'products.product'], null=False)),
            ('to_product', models.ForeignKey(orm[u'products.product'], null=False))
        ))
        db.create_unique(m2m_table_name, ['from_product_id', 'to_product_id'])


    def backwards(self, orm):
        # Removing M2M table for field related_products on 'Product'
        db.delete_table(db.shorten_name(u'products_product_related_products'))


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
            'first_paragraph': ('django.db.models.fields.TextField', [], {'max_length': '2000'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('django.db.models.fields.files.ImageField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '25'}),
            'second_paragraph': ('django.db.models.fields.TextField', [], {'max_length': '2000'}),
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
            'related_products': ('django.db.models.fields.related.ManyToManyField', [], {'related_name': "'related_products_rel_+'", 'blank': 'True', 'to': u"orm['products.Product']"}),
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