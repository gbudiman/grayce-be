# Grayce Demo App

## Setup
This guide assumes OSX, but may work on any \*nix system with minor tweaks.

### Base dependencies
* Ruby 2.7.1
* Bundler 2.1.x
* Postgres 12.x
* Redis 6.x
* node 14.x
* yarn 1.22.x
* Chromedriver 83.x

You can install these any way you want, but brew is a fast and easy way to do it.
Install [brew](https://brew.sh/) if you don't already have it.

```
brew install rbenv
brew install postgresql
brew install redis
brew install node
brew install yarn
brew cask install chromedriver
rbenv install 2.7.1
```

### Clone repo
```
git clone git@github.com:withgrayce/grayce-demo.git
cd grayce-demo
bundle
yarn
```

### Init data
There are scripts to generate a set of fake data for use in dev/staging.

```
./bin/rails \
    db:drop \
    db:create \
    db:structure:load \
    db:migrate \
    db:test:prepare \
    db:seed
```

### Test suite
The test suite should now work

```
rspec
```

### Running the app
You can run the Rails application with:

```
./bin/rails server
```

## Task
Grayce uses Care Journeys to communicate the current care situation, concerns, and goals.
A care journey has the following data

* Summary of care situation
* Summary of goals
* Stage:
  * Independant
  * Interdependent
  * Dependent
  * Crisis
  * Griefing

Additionally care plans have "action plans", which have a title and summary and can be marked as complete by a user.

### Admin
The goal is to allow an admin user to build a care plan for a user.

### User

The care plan is then displayed to the user, who can mark care tasks as complete.
