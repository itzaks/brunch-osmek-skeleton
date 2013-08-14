Server = require './server'

#start from brunch
exports.startServer = (port, path, callback) ->
  init(port)

#abstract init
init = (port) ->
  port = process.env.PORT or 3000
  server.start(port)

server = new Server()
init() unless module.parent
