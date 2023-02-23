# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

YOu need a Docker to run it :)

* Configuration

please do the following steps:

** prepare Docker sync:
Install docker-sync:
`gem install docker-sync`

and:
```
brew install unison
brew install autozimu/homebrew-formulas/unison-fsmonitor
```

You need to run a docker sync in a background to make app working (in a separate term window / tab):
```
docker-sync start --foreground
```

** docker compose:
```
docker-compose build
```

* prepare ENV file
```
cp .env.example .env
```

* Database creation

```
docker-compose run --rm app bundle exec rails db:create
```

* Database initialization

```
docker-compose run --rm app bundle exec rails db:migrate
```

* Seed database from JSON files

```
docker-compose run --rm app bundle exec rails import:json
```

* How to run the test suite

```
docker-compose run --rm rspec bundle exec rspec
```

* Deployment instructions

Please run on production to make it working:

```
whenever --update-crontab
```

* TODO:
- missing request RSpec for API endpoints
- Add paper_trail gem :)
