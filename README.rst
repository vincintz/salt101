=================
Salt Vagrant Demo
=================

A Salt Demo using Vagrant.

Formula
=======

Installs common base packages: vim and htop
Installs libnacl

In svr-salt/states. Mapped to /svr/salt/states

Pillar
======

Not used, sample only

In svr-salt/pillars. Mapped to /svr/salt/pillars

Instructions
============

Run the following commands in a terminal. Git, VirtualBox and Vagrant must already be installed.

.. code-block:: bash

    [host]$ vagrant plugin install vagrant-vbguest
    [host]$ vagrant up
    [host]$ vagrant ssh

    # in vagrant box
    [vagrant@localhost ~]$ sudo salt-call --local nacl.keygen
