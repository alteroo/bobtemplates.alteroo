Background
=============
This is an opinionated project with only one mission: make it as easy as possible to develop, deploy and maintain
a complete Plone site. 

The project provides a simple way to:

- generate and share a Plone development environment.
- deploy your customizations into production

This is heavily based on https://github.com/plone/bobtemplates.plone.
It targets newbie developers and administrators by focusing
on streamling the following tasks:

- Setup 
- Customization
- Deployment (work in progress)
- Backup and Restore (work in progress)


Supported Platforms
-------------------

We assume you have sudo privileges on your development box.
We also assume that you're using Ubuntu 14.04 (it may work on other deb type distributions). We now have experimental support for Mac OS X.

Note for Gitlab users
^^^^^^^^^^^^^^^^^^^^^

This system can automatically prepare a gitlab project and do an initial check-in to the repository.
You will be prompted for your gitlab token.
BEFORE YOU START make a note of your gitlab private token
You can find your gitlab private token at https://gitlab.com/profile/account

.. image:: https://raw.githubusercontent.com/alteroo/roosite.launchkit/master/images/private-token.png


