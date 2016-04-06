config = require "lapis.config"

config "development", ->
	port 9989

config "production", ->
	port 9989
	code_cache "on"