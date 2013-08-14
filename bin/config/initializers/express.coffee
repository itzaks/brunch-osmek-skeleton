# Express Configuration & Initialization
# ----------------------------------------------

@include = ->
	brunchDir = "#{ __dirname }/../../../brunch"

	# Parse Request Bodies
	@use 'bodyParser': {keepExtensions: true, uploadDir: "/tmp"}

	# RESTful Requests
	@use 'methodOverride'

	# Jade & layouts
	@use 'partials'
	@app.engine 'jade', require('jade').__express
	@set 'view engine': 'jade'
	@set 'views': "#{ brunchDir }/app/views/templates"

	# Cookies
	@use @express.cookieParser 'lololol'

	# Router
	@use @app.router

	#Brunch
	@use 'static': brunchDir + "/public"


