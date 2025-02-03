#!/bin/bash

set -e # Exit on errors. Easier for debuting

# Django crm reqs. Installation in virtual environment! No need to activate it separately
# Work dir is taken from Dockerfile
/venv/bin/pip install -r django-crm/requirements.txt

# Wsgi + nginx prod setup deps
/venv/bin/pip install uwsgi

# Publish config via symbolic link
ln -s /etc/nginx/sites-available/aventura-crm.conf /etc/nginx/sites-enabled/

# Start nginx
service nginx start

# Activate python virtual environment
source /venv/bin/activate

# Start Unix web socket gateway interface (in activated virtual environment)
uwsgi --ini /home/aventura-crm/django-crm/webcrm/webcrm_uwsgi.ini

# Modify .bashrc to automatically activate the virtual environment on every bash session
echo "source /venv/bin/activate" >> /root/.bashrc

# Keep the container running
tail -f /dev/null
