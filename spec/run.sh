#!/bin/bash
source /etc/profile.d/rvm.sh

bundle check || bundle install

guard
