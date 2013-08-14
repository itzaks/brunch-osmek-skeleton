Layout = require 'views/layout'
Router = require 'lib/router'
Post = require 'models/post'
Posts = require 'models/posts'

module.exports = class Application
  constructor: (posts) ->
    _.extend @, Backbone.Events

    @router = new Router
    @posts = new Posts
    @bootstrap(posts)

    $ => @ready()

  bootstrap: (posts) ->
    @posts.add(new Post data) for data in posts

  ready: ->
    @layout = new Layout {el: $("#application")}
    Backbone.history.start {pushState: true}
