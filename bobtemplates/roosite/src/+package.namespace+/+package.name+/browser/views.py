from Products.Five.browser import BrowserView
from zope.interface import alsoProvides
from plone import api

class HelloWorld(BrowserView):

    portal = api.portal.get() 
