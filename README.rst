salt-logstash-formula
=====================

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Install
=======

To finish the installation, you have to edit yourself the config file.

Available states
================

.. contents::
    :local:

``logstash``
------------

Runs the state to install logstash and configure the common files.

``logstash.install``
--------------------

Install logstash

``logstash.config``
-------------------

Manage logstash configuration file.

``logstash.service``
---------------------

Manage the startup and running state of logstash.
