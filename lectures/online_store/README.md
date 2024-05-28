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

## App description

Online store with products. Each product has:

- Name
- Description
- Image
- Price

The app has a view for admin and for user.

### Admin view

Admin view is under product controller. It has the following actions on product (scaffold):

- index
- new
- show
- create
- edit
- update
- destroy

### User view

User view is under product controller. It has the following actions on product:

- index
- add_to_cart
