# Todo Application

Todo app built with ruby on rails!

## Dependencies
- Ruby on rails 5.2
- ruby `2.6.3`
- bundler `2.1.4`
- postgres

## Installation

Install and start postgresql:
- On macOS, you can use `pg_ctl -D /usr/local/var/postgres start`
- (To stop postgres use `pg_ctl -D /usr/local/var/postgres stop`)

Alternatively you can use homebrew to install and start postgres

git clone https://github.com/stephenisau/todo-caddie-now.git onto your local machine

Run `cd /todo-caddie-now/config/database.yml`
Copy and replace the contents inside with this:
```
default: &default
  adapter: postgresql
  encoding: unicode
  host: localhost
  username: postgres
  password: password
  pool: 5

development:
  <<: *default
  database: todo_development


test:
  <<: *default
  database: todo_test
```
Run `bundle install` to install all dedpendencies
Run `rails db:migrate` to setup the database migrations
[OPTIONAL] Run `rails db:seed` to setup fake data
Finally run  `rails server` to start the server 

Finally, go to [http://localhost:3000](http://localhost:3000) to view app.

### Docker

This app can be setup and run through Docker.
Make sure you have the Docker Desktop application installed on your local machine. Instructions can be found [here](https://docs.docker.com/engine/install/).

Once you've properly gotten docker installed, follow these steps:

git clone https://github.com/stephenisau/todo-caddie-now.git onto your local machine.
Run `cd /todo-caddie-now/config/database.yml`
Copy and replace the contents inside with this:
```
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password: password
  pool: 5

development:
  <<: *default
  database: todo_development


test:
  <<: *default
  database: todo_test
```
Run `docker-compose build`
Run `docker-compose up`

Finally, go to [http://localhost:3000](http://localhost:3000) to view app.

