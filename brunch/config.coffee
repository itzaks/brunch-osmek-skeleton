# See http://brunch.readthedocs.org/en/latest/config.html for documentation.
exports.config =

  paths:
    public: 'public'

  plugins:
    static_jade:
      extension: ".static.jade"

  server:
    path: '../bin/init.coffee'
    run: yes

  autoReload:
    port: 1234

  files:
    javascripts:
      defaultExtension: 'coffee'
      joinTo:
        'javascripts/app.js': /^app/
        'javascripts/vendor.js': /^vendor/
        'test/javascripts/test.js': /^test(\/|\\)(?!vendor)/
        'test/javascripts/test-vendor.js': /^test(\/|\\)(?=vendor)/
      order:
        before: [
          # Backbone
          'vendor/scripts/jquery-1.9.1.js',
          'vendor/scripts/underscore-1.4.4.js',
          'vendor/scripts/backbone-0.9.10.js',
          # Auto-reload
          'vendor/scripts/auto-reload-brunch.js',
        ]
        after: [
        ]
    stylesheets:
      defaultExtension: 'styl'
      joinTo:
        'stylesheets/app.css': /^app/
        'stylesheets/vendor.css': /^vendor/
      order:
        before: []
        after: []
    templates:
      defaultExtension: 'jade'
      joinTo: 'javascripts/app.js'
  framework: 'backbone'
