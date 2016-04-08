import Widget from require "lapis.html"

class Layout extends Widget
	content: =>
		html_5 ->
	    	head ->
	    		title "Just a chill room"
	    		link rel: "stylesheet", type: "text/css", href: "/app/static/semantic.min.css"
	    		style -> raw [[
	    			body > .ui.container {
	    				margin-top: 3em;
	    			}
	    		]]

	    	body ->
	    		@content_for "inner"
	    		script type: "text/javascript", src: "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-beta1/jquery.min.js"
	    		script type: "text/javascript", src: "/app/static/semantic.min.js"
	    		@content_for "script_post"