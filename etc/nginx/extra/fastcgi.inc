location / {
        
    if (!-f $request_filename) {
        rewrite (.*) /index.php;
    }

    fastcgi_pass        127.0.0.1:9000;
    fastcgi_index       index.php;
    include             extra/fastcgi_params;
}