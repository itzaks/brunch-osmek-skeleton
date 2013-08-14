needle = require 'needle'
config = require './settings'

module.exports = class Server
  start: (port) ->
    server = this
    require('zappajs') port, ->
      @helper backbone: ->
        server.osmek (data) =>
          return unless data or data.length is 0
          @render 'index', {layout: 'layout', data: data}

      @helper post: (to) ->
        console.log "POSTDATA", @body

      @configure @include './config/initializers/express'
      @include './content.coffee'

  osmek: (callback) ->
    needle.post 'http://cms.osmek.com/api/feed', config["osmek"], (err, resp, body) ->
      (console.log err; return callback []) if err

      data = JSON.parse(body)
      callback data["items"]
