View = require './view'

module.exports = class Index extends View
  template: require './templates/index'
  bootstrap: ->
    @on "#{@cid}:render:after", @renderFeed

  renderFeed: =>
    templates =
      generic: require './templates/post-generic'

    console.log "posts:", app.posts.toJSON()

    feed = for post in app.posts.models
      view = new View(model: post)
      view.template = templates["generic"]
      view.render().el

    @$("#list").html feed

