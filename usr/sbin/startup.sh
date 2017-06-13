#!/bin/bash

if [ "${VIRTUAL_HOST-UNDEF}" = "UNDEF" ]; then
	export VIRTUAL_HOST='_'
fi

if [ "${HTDOCS_DIR-UNDEF}" = "UNDEF" ]; then
	export HTDOCS_DIR='htdocs'
fi

/usr/bin/envsubst '$$VIRTUAL_HOST $$HTDOCS_DIR' < /etc/nginx/tmpl/default.conf.tmpl > /etc/nginx/conf.d/default.conf

sed -i "s/^error_log\s*=.*/error_log = \/dev\/stderr/g" /etc/php-fpm.conf
sed -i "s/^php_admin_value\[error_log\]\s*=.*/php_admin_value[error_log] = \/dev\/stderr/g" /etc/php-fpm.d/www.conf
sed -i "s/^slowlog\s*=.*/slowlog = \/dev\/stdout/g" /etc/php-fpm.d/www.conf

/usr/sbin/nginx && /usr/sbin/php-fpm -F