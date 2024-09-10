#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake dartsass:build
bundle exec rake assets:clean
bundle exec rake RAILS_ENV=production db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1
bundle exec rake db:create db:migrate db:seed

# sass app/assets/style.scss:app/assets/stylesheets/style.css --style compressed