'use strict';

module.exports = function (grunt) {

    grunt.initConfig({
        hub: {
            all: {
                src: ['ngapp/Gruntfile.js'],
                tasks: ['build']
            }
        }
    });

    grunt.loadNpmTasks('grunt-hub');

    grunt.registerTask('default', ['hub']);

    grunt.registerTask('heroku:production', ['hub']);

};
