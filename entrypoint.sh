#!/bin/sh

# set env vars to defaults if not already set
if [ ! $LOG_LEVEL ]
  then
  export LOG_LEVEL=warn
fi

if [ ! $LOG_FORMAT ]
  then
  export LOG_FORMAT="%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-agent}i\" \"%{cache-status}e\" \"%{remix_request_id}i\" %D"
fi

# validate required variables are set

# update configuration based on env vars
/bin/sed "s/{{LOG_LEVEL}}/${LOG_LEVEL}/g; s/{{LOG_FORMAT}}/'${LOG_FORMAT}'/g" /etc/apache2/conf.d/demo.conf.in > /etc/apache2/conf.d/demo.conf

rm -f /run/apache2/httpd.pid

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
  set -- httpd "$@"
fi

exec "$@"