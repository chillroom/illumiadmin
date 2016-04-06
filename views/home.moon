import Widget from require "lapis.html"

class Index extends Widget
	content: =>
		div class: "ui text container", ->
			h1 class: "ui dividing header", "IllumiBot"
			
			h3 class: "first", "Manage"
			p -> button class: "ui labeled icon primary button restart", ->
				i class: "refresh icon"
				text "Restart bot"

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

		@content_for "script_post", ->
			script type: "text/javascript", -> raw [[
				$('.button.restart').api({
					url: ']] .. @url_for("api_restart") .. [[',
					method: "POST",

					successTest: function(response) { return response.success || false; },
					onSuccess: function(response) { $(".ui.basic.success.modal").modal("show"); },
					onFailure: function(response) { $(".ui.basic.failure.modal").modal("show"); }
				})
			]]