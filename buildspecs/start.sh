#!/bin/bash
RAILS_ENV=$RAILS_ENV bundle exec rake db:create
RAILS_ENV=$RAILS_ENV bundle exec rake db:migrate
RAILS_ENV=$RAILS_ENV bundle exec rake db:seed

rm -f /myapp/tmp/pids/server.pid
RAILS_ENV=$RAILS_ENV bundle exec rails server -b '0.0.0.0'
