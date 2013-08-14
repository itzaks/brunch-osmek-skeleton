#ROUTES
@include = ->

  # CLIENT
  @get '/': -> @backbone()

  # API
  @post '/form': -> @post('form:submit')
