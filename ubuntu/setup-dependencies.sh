#!/bin/sh

sudo apt-get install -y make python-pip nginx gunicorn python-gevent python-flask

sudo pip install https://github.com/whosonfirst/py-mapzen-whosonfirst-placetypes/tarball/master
