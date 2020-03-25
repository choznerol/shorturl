# shorturl

![RSpec](https://github.com/choznerol/shorturl/workflows/Ruby/badge.svg?branch=master)

A simple URL-shorten service. [Try it online](https://shorturl-production.herokuapp.com/)

> ![demo](https://user-images.githubusercontent.com/12410942/77493543-6523c880-6e7e-11ea-8e8a-29244f558da3.gif)


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
