# Build

[![Build Status](https://travis-ci.org/Absor/bookshelf.svg?branch=master)](https://travis-ci.org/Absor/bookshelf)
[![Coverage Status](https://coveralls.io/repos/Absor/bookshelf/badge.png?branch=master)](https://coveralls.io/r/Absor/bookshelf?branch=master)

# Bookshelf

User can keep track of their library and wanted books by having virtual bookshelves where they can add books.

# Data model

![Data model](http://yuml.me/diagram/scruffy;/class/[User]1-*[Shelf], [Shelf]*-*[Book]) or by Rails models:
![Data model](http://yuml.me/diagram/scruffy;/class/[User]1-*[Shelf], [Shelf]1-*[BookOnShelf], [BookOnShelf]*-1[Book])

# Heroku setup

This sofware uses nodejs-grunt-compass buildpack to first build the Angular project and then the basic Ruby buildpack to setup Rails project.

1. Create an instance
2. Setup buildpack

    ```
    heroku config:add BUILDPACK_URL=https://github.com/ddollar/heroku-buildpack-multi.git
    ```

3. Setup environment variables

    ```
    heroku config:set NODE_ENV=production
    ```

4. Push to Heroku

# Untested

* Renaming a bookshelf.
* Adding a book that is already in the database to a shelf.
* Unauthorized access causes forced logout.
