module.exports = Backbone.Router.extend
  initialize: ->
    @route '', 'index', -> @view 'index'

  view: (name) ->
    app.trigger "view:change", name
