from Products.Five.browser import BrowserView
from plone import api

class HelloWorld(BrowserView):

    def __call__(self):
        portal = api.portal.get()
