Installation 
=============

**Step 0 - Install and initialize**

The 'init-roo' command prepares a virtualenv called 'rooenv' which can be reused
each time you want to initialize a site, you only need to run these commands
once with the account you use for development.
::
   
   curl -L https://roosite.github.io | bash && source ~/.bash_profile

**Step 1 - Use roosite to initialize and build the site environment**

This step will initialize the site build folder (also called buildout directory), 
named using the pattern '$customer.site'. 

If you choose to generate a gitlab repository (it will be placed in a group prefixed with the name 'roo' e.g. roo-customer/customer.site)

If your customer name is `acme` the steps would look something like this.
(It's a good idea to use a single word and all common letters)
::

    roosite acme
    cd acme.site
    bash init.sh

Launch the site by going to the $customer.site directory and running the instance, using the example of 'acme'
it would look like this
::

    bin/instance fg
        
The site will be available at ``localhost:8080/Plone``. 

Use the credentials ``admin:admin``

**Step 2 - Customize the setuphandlers.py file**

Look for the setuphandlers file, located under `src/{CUSTOMER}/site/setuphandlers.py`
There are two methods provided `install_settings` and `custom_setup`.

Use install_settings to customize installation settings
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Customize installation settings in the `install_settings` method
::

     change all smtp and email settings as needed

Use custom_setup to add custom content, workflow constraints etc
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Customize the `custom_setup` method, this uses the Plone API to change folders and other configuration
at post install. 

Remember to comment line 17 (or close to that), otherwise 
your customizations work will be ignored.
::

    if True: return # COMMENT THIS LINE OUT SO THAT CUSTOMIZATIONS ACTUALLY RUN

Commands
----------
update_roo
    Run this to get the latest version of the roosite command

roosite
    Used to initial a new site

Philosophy
----------

This is a further exploration of the ideas from a presentation entitled
`Zero to Plone: Towards faster developer onboarding 
<https://2016.ploneconf.org/talks/from-zero-to-plone-towards-faster-developer-onboarding>`_

It is distilled into the following working checklist:

- Treat each customer project as a standalone product.
- Simplify, Simplify, Simplify
- Actively make this better through what we learn in real projects

Because of the underlying philosophy we don't aim to support other use cases.
To stay focused we only officially support stable Ubuntu for now.

Features
--------

Packages created with ``bobtemplates.alteroo`` are designed to follow best-practices
where possible. We try to stay laser focused on sensible defaults and will include
things that match Alteroo specific processes.

Dependencies
^^^^^^^^^^^^

Sites generated with this package include the following add-ons as dependencies:

rapido.plone
gloss
collective.routes
collective.z3cform.norobots
wildcard.media
Products.PloneFormGen
plone.app.mosaic

Useful terms
^^^^^^^^^^^^
The following terms are useful to grasp.

Buildout
    The package is a buildout directory that allows you to build Plone with the new package installed for development, testing and deployment purposes.

Tests
    The package comes with a test setup and some `tests <http://docs.plone.org/external/plone.app.testing/docs/source/index.html>`_ for installing the package. It also contains a `robot-test <http://docs.plone.org/external/plone.app.robotframework/docs/source/index.html>`_ that tests logging in. The buildout also contains a config to allow testing the package on `travis <http://travis-ci.org/>`_ that sends `notifications <http://about.travis-ci.org/docs/user/notifications>`_ by email to the package author.

Profile
    The package contains a `Generic Setup Profile <http://docs.plone.org/develop/addons/components/genericsetup.html>`_ that installs a browserlayer. For Plone 5 it also contains a uninstall-profile.

Locales
    The package registers a directory for locales, so you can do multi-lingual sites.

Template-Overrides
    The package registers the folder ``browser/overrides`` as a directory where you can drop template-overrides using `z3c.jbot <https://pypi.python.org/pypi/z3c.jbot>`_.

Setuphandler
    The package contains a `setuphandlers.py <http://docs.plone.org/develop/addons/components/genericsetup.html?highlight=setuphandler#custom-installer-code-setuphandlers-py>`_ where you can add code that is executed on installing the package. For Plone 5 there is also a method in `setuphandler.py` that is run on uninstalling.

Unlike bobtemplates.plone we do not provide additional profiles such as `Theme` and `Dexterity`

Documentation
-------------

Full documentation for this system can be found in the "docs" folder.



Contribute
----------
Feel free to contribute via our github repository.
- Source Code: https://github.com/alteroo/roosite.launchkit


Support
-------

If you are having issues, please let us know by using our issue tracker.

- Issue Tracker: https://github.com/alteroo/roosite.launchkit/issues
