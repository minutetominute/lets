# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Problems installing pg gem
sudo env ARCHFLAGS="-arch x86_64" gem install pg

# Problems install sqlite gem
gem install sqlite3 -- --with-sqlite3-lib=/usr/lib
