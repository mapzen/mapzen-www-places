#!/bin/sh

sudo apt-get install -y make nginx gunicorn python-gevent python-flask

sudo easy_install https://github.com/whosonfirst/py-mapzen-whosonfirst-placetypes/tarball/master
