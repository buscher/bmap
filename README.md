# bMAP
Visualize your Garmin activities on a single map.

## NOTE
This is just a small testing program, nothing serious. But maybe it will help your inspiration :)

# Setup

- Checkout and build [gpx2js-rs](https://github.com/buscher/gpx2js-rs)
- Checkout [garmin-connect-export](https://github.com/pe-st/garmin-connect-export)

Create a file: config/env.sh
with the following content:
```sh
export GPX2JS_RS="<absolute path to gpx2js-rs>"
export GARMIN_CONNECT_EXPORT="<absolute path to gcexport.py>"
export GARMIN_USER="<garmin username>"
export GARMIN_PW="<garmin pw>"
```

# Example Usage

```sh
# To download your garmin activities
$ ./download.sh
# convert all the activities into a single map
$ ./convert.sh
```

# Screenshots

![screenshot](http://www.buschinski.de/img-misc/walkmap.png)
