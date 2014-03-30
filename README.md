# Build

[![Build Status](https://travis-ci.org/Absor/bookshelf.svg?branch=master)](https://travis-ci.org/Absor/bookshelf)

# Heroku setup

This sofware uses nodejs-grunt-compass buildpack to first build the angular project and then the basic Ruby buildpack to setup Rails project.

1. Create instance
2. Setup buildpack

    ```
    heroku config:add BUILDPACK_URL=https://github.com/ddollar/heroku-buildpack-multi.git
    ```

3. Setup environment variables

    ```
    heroku config:set NODE_ENV=production
    ```

4. Push to Heroku