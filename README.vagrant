#################################################################
# A Virtual Machine for Ruby on Rails Core Development
#################################################################
# Modified for SwampCo Backend Development
#################################################################

## Introduction

This project automates the setup of a development environment for working on Ruby on Rails itself. Use this virtual machine to work on a pull request with everything ready to hack and run the test suites.

Please note this virtual machine is not designed to be used for Rails application development.

## Requirements
* [VirtualBox](https://www.virtualbox.org)
* [Vagrant 1.1+](http://vagrantup.com)

## How To Build The Virtual Machine

Building the virtual machine is this easy:

    host $ git clone https://github.com/SwampCo/Backend.git
    host $ cd backend
    host $ vagrant up

That's it.

If the base box is not present that command fetches it first. The setup itself takes about 3 minutes in my MacBook Air. After the installation has finished, you can access the virtual machine with

    host $ vagrant ssh
    Welcome to Ubuntu 12.04 LTS (GNU/Linux 3.2.0-23-generic-pae i686)
    ...
    vagrant@swampco:~$

Port 3000 in the host computer is forwarded to port 3000 in the virtual machine. Thus, applications running in the virtual machine can be accessed via localhost:3000 in the host computer.

## What's In The Box

* Git
* RVM
* Ruby 2.0.0 (binary RVM install)
* Bundler
* Rails 4.0
* SQLite3, MySQL, and Postgres
* System dependencies for nokogiri, sqlite3, mysql, mysql2, and pg
* Databases and users needed to run the Active Record test suite
* Node.js for the asset pipeline
* Memcached
* MongoDB

## Recommended Workflow

The recommended workflow is

    1. Edit in the host computer and
    2. Test within the virtual machine.

We are ready to go to edit in the host, and test in the virtual machine.

This workflow is convenient because in the host computer you normally have your editor of choice fine-tuned, Git configured, and SSH keys in place.

## Virtual Machine Management

When done just log out with `^D` and suspend the virtual machine

    host $ vagrant suspend

then, resume to hack again

    host $ vagrant resume

Run

    host $ vagrant halt

to shutdown the virtual machine, and

    host $ vagrant up

to boot it again.

You can find out the state of a virtual machine anytime by invoking

    host $ vagrant status

Finally, to completely wipe the virtual machine from the disk **destroying all its contents**:

    host $ vagrant destroy # DANGER: all is gone

Please check the [Vagrant documentation](http://vagrantup.com/v1/docs/index.html) for more information on Vagrant.
