import Widget from require "lapis.html"

appdir = (str) -> "/app#{str}"
static = (str) -> appdir "/static#{str}"

class Index extends Widget
	content: =>
		html_5 ->
	    	head ->
	    		title "IllumiBot"
	    		link rel: "stylesheet", type: "text/css", href: static "/semantic.min.css"
	    		style -> raw [[
	    			.container {
	    				padding: 5em 0em;
	    			}
	    		]]

	    	body ->
	    		@content_for "inner"
	    		script type: "text/javascript", src: "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-beta1/jquery.min.js"
	    		script type: "text/javascript", src: static "/semantic.min.js"
	    		@content_for "script_post"