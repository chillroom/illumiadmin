# IllumiBot web dashboard

This dashboard allows you to restart the bot without needing to contact qais.

Visit [admin.just-a-chill-room.net](http://admin.just-a-chill-room.net) and log in
using the details given to you.

Software used: (incomplete list)

* lua
* luarocks
* [lapis](http://leafo.net/lapis) (main framework, see installation instructions here)
* moonscript (to compile)
* tup (not necessary, but simplifies the development process)
* openresty (nginx is included as part of openresty)

Structure:

* app.moon - main logic
* nginx.conf - self explanatory, also used for basic authentication
* config.moon - general config file
* static/ - contains css/js files
* views/ - contains widgets and layouts that generates html
* mime.types - base mime types file for nginx
* Tuprules.tup - development compilation utility file
* Tupfile - see above

You can use "lapis server" to quickly start a **local server**.
In production an nginx `proxy_pass` is used to access this local server.

Something is harcoded to work on the "production" server (see app.moon, `api_restart` route,
`HOME` variable). If this website is ever expanded this will be moved to a config file.

Contact qaisjp for more information about setting this website up.