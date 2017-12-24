location = /404.html {
    root /usr/share/nginx/html;
}

location = /50x.html {
    root /usr/share/nginx/html;
}

location = /favicon.ico {
    log_not_found off;
    access_log off;
}

location ~ /\. {
    deny all;
    access_log off;
    log_not_found off;
}

location ~* .+.(jpg|jpeg|gif|png|ico|swf|css|js|xml|zip|ttf|woff|eot)$ {
    access_log off;
    # expires 30d;
    # Disable cache
    add_header Cache-Control no-cache;
    expires 1s;
}

location ~ .(html|htm)$ {
	
}