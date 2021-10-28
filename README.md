# IBAN APIfier

This projects aims to be an api server example for IBANs made based on the test assignment.

# CODING TEST NOTE

I generally prefer to use the same database (usually PostgreSQL) in all environments, but I chose SQLite in development to make the evaluator's job easier when reviewing my project, since it requires zero setup.

* Development and test: SQLite
* Production: PostgreSQL

# Latest Ruby and Gems Versions

The project uses Rails 6.1.4 (API module) and Ruby 2.5.8 and intends to be kept up to date.

# Setup

Install dependencies and create the database with `bin/setup`.

# Run

Just `rails server`.

# Test

This project has been developed using TDD process and all code is tested using Rspec.
Tests are re-launched automatically with every change to directories thanks to Guard gem.
(https://github.com/guard/guard)
Tests cover the Iban model validations and the Iban controller HTTP requests.

Run `rspec`.

# Todo Future List

* Add Serialization for shown data
* Add Authorization and Authentication functionality

# Deploy

* Commit to master (or open a pull request)
* Push to github (https://github.com/Adamsonson/iban-apify)
* Done (or accept the pull request)
* Automatic deploy to Heroku launched

Heroku: https://dashboard.heroku.com/apps/rocky-reaches-49290/deploy
