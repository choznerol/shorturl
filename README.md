# shorturl

A simple URL-shorten service

## Getting Started

Ensure you have a ruby version match `.ruby-version`

    $ rvenv local # Or equivilent tool

Run a Postgres locally with:

    $ docker-compose up

Run this setup script to install dependencies and set up development/test databases. 

    $ ./bin/setup

Now you can run the tests

    $ ./bin/rspec

After setting up, you can run the application using [Heroku Local]:

    % heroku local web

[Heroku Local]: https://devcenter.heroku.com/articles/heroku-local
