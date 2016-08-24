[GoAccess](https://goaccess.io/) in a Docker container. Uses Tokyo Cabinet on-disk B+ Tree for storage.

## Usage

Assuming you're running nginx in a docker container, you might do something like this:

	$ docker run -d -v /some/content:/usr/share/nginx/html:ro \
	      -v /some/file:/var/log/nginx/access.log nginx

	$ docker run --rm -v /some/file:/access.log -v /tmp/report.html:/report.html \
	      mbodenhamer/goaccess -f /access.log -o /report.html

### Live Stats

For live stats, you might do something like this:

	$ docker run -d -v /some/content:/usr/share/nginx/html:ro \
	      -v /some/file:/var/log/nginx/access.log nginx

	$ docker run -d -v /some/file:/access.log -v /tmp/report.html:/report.html \
	      -p 7890:7890 mbodenhamer/goaccess --real-time-html -f /access.log -o /report.html
