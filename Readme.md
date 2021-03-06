
[![](https://images.microbadger.com/badges/image/tlnk/docker-grav.svg)](https://microbadger.com/images/tlnk/docker-grav "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/tlnk/docker-grav.svg)](https://microbadger.com/images/tlnk/docker-grav "Get your own version badge on microbadger.com")

# Grav CMS

![Screenshot](https://getgrav-grav.netdna-ssl.com/user/pages/01.tour/_easy-to-use/001-dashboard.png?g-4c8581e6)

# Supported tags and respective

* latest [apache/Dockerfile](https://github.com/tle06/docker-grav/blob/master/Dockerfile)

This image is updated via pull requests to the tle06/docker-grav GitHub repo.

# What is grav

Grav is a **Fast**, **Simple**, and **Flexible**, file-based Web-platform.  There is **Zero** installation required.  Just extract the ZIP archive, and you are already up and running.  It follows similar principles to other flat-file CMS platforms, but has a different design philosophy than most. Grav comes with a powerful **Package Management System** to allow for simple installation and upgrading of plugins and themes, as well as simple updating of Grav itself.

The underlying architecture of Grav is designed to use well-established and _best-in-class_ technologies to ensure that Grav is simple to use and easy to extend. Some of these key technologies include:

* [Twig Templating](http://twig.sensiolabs.org/): for powerful control of the user interface
* [Markdown](http://en.wikipedia.org/wiki/Markdown): for easy content creation
* [YAML](http://yaml.org): for simple configuration
* [Parsedown](http://parsedown.org/): for fast Markdown and Markdown Extra support
* [Doctrine Cache](http://doctrine-orm.readthedocs.io/projects/doctrine-orm/en/latest/reference/caching.html): layer for performance
* [Pimple Dependency Injection Container](http://pimple.sensiolabs.org/): for extensibility and maintainability
* [Symfony Event Dispatcher](http://symfony.com/doc/current/components/event_dispatcher/introduction.html): for plugin event handling
* [Symfony Console](http://symfony.com/doc/current/components/console/introduction.html): for CLI interface
* [Gregwar Image Library](https://github.com/Gregwar/Image): for dynamic image manipulatio

# Image configuration

* apache2
* nano
* git
* unzip
* php7.2
* libapache2-mod-php7.2
* php7.2-common
* php7.2-mbstring
* php7.2-xmlrpc
* php7.2-soap
* php7.2-gd
* php7.2-xml
* php7.2-cli
* php7.2-curl
* php7.2-zip
* php7.2 ldap

* port 80
* workdir = /var/www/app

* grav cms
* grav plugin admin

# Available ENV variable

* __PHP_UPLOAD_MAX_FILESIZE__ = 2M
* __PHP_POST_MAX_SIZE__ = 8M
* __PHP_MEMORY_LIMIT__ = 128M
* __PHP_FILE_UPLOAD__ = On
* __PHP_ALLOW_URL__ = On

# How to use this image
## Start grav

Starting the grav instance listening on port 80 is as easy as the following:
``` Docker

$ docker run -d -p 80:80 tlnk/docker-grav

```
Then go to http://localhost/admin and go through the wizard.


## Persistent data

All data beyond what lives in the database (file uploads, etc) is stored within the default volume /var/www/app. For more information about the folder please refer to this [URL](https://learn.getgrav.org/basics/folder-structure).

* -v /<mydatalocation>:/var/www/app

# Rancher template
An rancher template is also available [here](https://github.com/tle06/rancher-catalog.git)