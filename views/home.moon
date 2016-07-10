import Widget from require "lapis.html"

class Home extends Widget
	content: =>
		div class: "ui text container", ->
			h1 class: "ui dividing header", "Just a chill room"
			
		section class: "ui text container", ->
			h3 class: "first", "Manage Dubtrack bot"
			p -> button class: "ui labeled icon primary button restart_bot", ->
				i class: "refresh icon"
				text "Restart"
		
		section class: "ui text container", ->
			h3 class: "first", "Manage API"
			p -> button class: "ui labeled icon primary button restart_api", ->
				i class: "refresh icon"
				text "Restart"

		section class: "ui text container", ->
			h3 class: "first", "Other"
			p ->
				text "ID getter bookmarklet (drag to bookmarks bar, press whilst inside dubtrack)"
				a class: "ui primary button", href:[[javascript:var person = prompt("Enter username to get ID"); $.getJSON("https://api.dubtrack.fm/user/"+person, (data) => { return prompt("ID for "+person+ " looks like",data.data._id) })]], "Drag me!"

		@content_for "script_post", ->
			script type: "text/javascript", -> raw [[
				successTest = function(response) { return response.success || false; }
				onSuccess = function(response) { $(".ui.basic.success.modal").modal("show"); }
				onFailure = function(response) { $(".ui.basic.failure.modal").modal("show"); }
				$('.button.restart_api').api({
					url: ']] .. @url_for("api_restart") .. [[',
					method: "POST",

					successTest: successTest,
					onSuccess: onSuccess,
					onFailure: onFailure
				})

				$('.button.restart_bot').api({
					url: ']] .. @url_for("bot_restart") .. [[',
					method: "POST",

					successTest: successTest,
					onSuccess: onSuccess,
					onFailure: onFailure
				})
			]]

		div class: "ui small basic modal success", ->
			i class: "close icon"
			div class: "ui icon header", ->
				i class: "checkmark icon"
				text "Success"
			div class: "actions", ->
				div class: "ui basic center inverted ok button", "I've got it."

		div class: "ui small basic modal failure", ->
			i class: "close icon"
			div class: "ui icon header", ->
				i class: "remove icon"
				text "Failure"
			div class: "actions", ->
				div class: "ui basic center inverted ok button", "I've got it."

		