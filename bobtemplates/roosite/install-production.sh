#!/bin/bash
virtualenv venv
ln -sf production.cfg buildout.cfg
venv/bin/python bootstrap-buildout.py
bin/buildout
echo "----> Adding a Plone site"
bin/instance run scripts/addSite.py Plone
