lapis = require "lapis"
console = require "lapis.console"
import respond_to, assert_error, capture_errors from require "lapis.application"
import render_html from require "lapis.html"

class extends lapis.Application
	layout: require "views.layout"
	@before_filter =>
		if (@route_name == "console") and (ngx.var.remote_user != "qaisjp")
			@write "fuck off"

	[home: "/"]: =>
		render: true

	[console: "/console"]: console.make!

	[api_restart: "/api_restart"]: capture_errors respond_to {
		on_error: => json: success: false
		POST: =>
			success = os.execute "export HOME=/home/qaisjp/; pm2 restart illumiapi"
			assert_error success == 0
			json: success: true
	}

	[bot_restart: "/bot_restart"]: capture_errors respond_to {
		on_error: => json: success: false
		POST: =>
			success = os.execute "export HOME=/home/qaisjp/; pm2 restart illumibot"
			assert_error success == 0
			json: success: true
	}