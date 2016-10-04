
.. image:: https://secure.travis-ci.org/plone/bobtemplates.plone.png?branch=master
    :target: http://travis-ci.org/plone/bobtemplates.plone

.. image:: https://coveralls.io/repos/plone/bobtemplates.plone/badge.svg?branch=master&service=github
    :target: https://coveralls.io/github/plone/bobtemplates.plone?branch=master
    :alt: Coveralls

.. image:: https://img.shields.io/pypi/dm/bobtemplates.plone.svg
    :target: https://pypi.python.org/pypi/bobtemplates.plone/
    :alt: Downloads

.. image:: https://img.shields.io/pypi/v/bobtemplates.plone.svg
    :target: https://pypi.python.org/pypi/bobtemplates.plone/
    :alt: Latest Version

.. image:: https://img.shields.io/pypi/status/bobtemplates.plone.svg
    :target: https://pypi.python.org/pypi/bobtemplates.plone/
    :alt: Egg Status

.. image:: https://img.shields.io/pypi/l/bobtemplates.plone.svg
    :target: https://pypi.python.org/pypi/bobtemplates.plone/
    :alt: License

bobtemplates.alteroo
=====================

``bobtemplates.alteroo`` provides a `mr.bob <http://mrbob.readthedocs.org/en/latest/>`_ template to generate packages for Plone projects.
It is a fork of ``bobtemplates.plone`` with additional 'opinions' that are specific to the way that Alteroo configures customer projects.


Quickstart
----------
This package is most commonly used for initializing a customer site.

We assume you have sudo privileges on your development box
We also assume that you're using Ubuntu 14.04 (it may work on other deb type distributions)

**Step 0 - Get your gitlab private token**

BEFORE YOU START make a note of your gitlab private token
You can find your gitlab private token at https://gitlab.com/profile/account

**Step 1 - Use mrbob to initialize the site**

This step will initialize the site configuration, create a group and repository
in gitlab (it currently uses 'alteroo' in the namespace e.g. alteroo-customer/customer.site)
It then creates a test installation of the site at /Plone. 

::

    virtualenv bobenv
    bobenv/bin/pip install --upgrade pip
    bobenv/bin/pip install bobtemplates.plone

    export customer=acme
    export template_url=https://github.com/alteroo/bobtemplates.alteroo/archive/master.zip#bobtemplates.alteroo-master/bobtemplates/roo_addon
    bobenv/bin/mrbob -O $customer.site $template_url

    bash $customer.site/init.sh

Launch the site by going to the $customer.site directory and running the instance
::

        cd $customer.site
        bin/instance fg
        
The site will be available at ``localhost:8080/Plone``, use the credentials ``admin:admin``

**Step 2 - Customize the setuphandlers.py file
Look for the setuphandlers file, located under src/CUSTOMER/SITE/setuphandlers.py

Customize installation settings in the install_settings method
::

     change all smtp and email settings as needed


Features
--------

Packages created with ``bobtemplates.alteroo`` are designed to follow best-practices where possible an sensible defaults.
They include some things that match the Alteroo specific processes.

Dependencies
^^^^^^^^^^^^^^
Sites generated with this package include the following add-ons as dependencies:

rapido.plone
gloss
collective.routes
collective.z3cform.norobots
wildcard.media
Products.PloneFormGen
plone.app.mosaic

Buildout
    The package is contained in a buildout that allows you to build Plone with the new package installed for testing-purposes.

Tests
    The package comes with a test setup and some `tests <http://docs.plone.org/external/plone.app.testing/docs/source/index.html>`_ for installing the package. It also contains a `robot-test <http://docs.plone.org/external/plone.app.robotframework/docs/source/index.html>`_ that tests logging in. The buildout also contains a config to allow testing the package on `travis <http://travis-ci.org/>`_ that sends `notifications <http://about.travis-ci.org/docs/user/notifications>`_ by email to the package author.

Profile
    The package contains a `Generic Setup Profile <http://docs.plone.org/develop/addons/components/genericsetup.html>`_ that installs a browserlayer. For Plone 5 it also contains a uninstall-profile.

Locales
    The package registers a directory for locales.

Template-Overrides
    The package registers the folder ``browser/overrides`` as a directory where you can drop template-overrides using `z3c.jbot <https://pypi.python.org/pypi/z3c.jbot>`_.

Setuphandler
    The package contains a `setuphandlers.py <http://docs.plone.org/develop/addons/components/genericsetup.html?highlight=setuphandler#custom-installer-code-setuphandlers-py>`_ where you can add code that is executed on installing the package. For Plone 5 there is also a method in `setuphandler.py` that is run on uninstalling.

The package-types `Dexterity` and `Theme` add the following to `Basic`:

Dexterity
    Adds a simple content-type (you get asked about its name) in ``profiles/default/types/`` with a python-schema in ``interfaces.py``.

Theme
    Adds a simple bootstrap-based Diazo theme in the folder ``theme/`` and registers it in ``profiles/default/theme.xml``



Documentation
-------------

Full documentation for this site can be found in the "docs" folder.

It is also available online at http://{{{ package.namespace }}}.alteroo-docs.appspot.com


Contribute
----------

- Issue Tracker: https://github.com/alteroo/bobtemplates.alteroo/issues
- Source Code: https://github.com/alteroo/bobtemplates.alteroo
- Documentation: 


Support
-------

If you are having issues, please let us know.
