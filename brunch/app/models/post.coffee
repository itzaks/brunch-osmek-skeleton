#Osmek post model

module.exports = class Post extends Backbone.Model
  url: ''
  defaults:
    title: "luls"
    postbody: "NO CONTENT"

  image: (id) ->
    image =
      square: "http://photos.osmek.com/#{ id }.200x200x1.jpg"
      large: "http://photos.osmek.com/#{ id }.l.jpg"
      original: "http://photos.osmek.com/#{ id }.o.jpg"

  parse: (response) ->
    response.images = if response.photo then [@image response.photo] else null
    response.description = $('<div>').html(response.postbody).text()

    response