#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake dartsass:build
bundle exec rake assets:clean
bundle exec rake  db:drop db:create db:migrate db:seed
bundle exec rake db:seed

# sass app/assets/style.scss:app/assets/stylesheets/style.css --style compressed