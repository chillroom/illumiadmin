lapis = require "lapis"
import respond_to, assert_error, capture_errors from require "lapis.application"
import render_html from require "lapis.html"

class extends lapis.Application
	layout: require "views.layout"
	[home: "/app"]: =>
		render: true

	[api_restart: "/app/api_restart"]: capture_errors respond_to {
		on_error: => json: success: false
		POST: =>
			success = os.execute "export HOME=/home/qaisjp/; pm2 restart illumiapi"
			assert_error success == 0
			json: success: true
	}

	[bot_restart: "/app/bot_restart"]: capture_errors respond_to {
		on_error: => json: success: false
		POST: =>
			success = os.execute "export HOME=/home/qaisjp/; pm2 restart illumibot"
			assert_error success == 0
			json: success: true
	}