#!/bin/bash
# Source RVM stuff
source /etc/profile.d/rvm.sh
# Source env vars
source ./spec/.docker-env

# Bundle only if necessary
bundle check || bundle install

# Start D-Bus and NetworkManager
service dbus start &> /dev/null
service network-manager start &> /dev/null 2>&1

# Exec guard
bundle exec guard
