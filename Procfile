web: bundle exec puma -p $PORT -C ./config/puma.rb
worker: bundle exec rails jobs:work
release: bundle exec rails db:migrate
