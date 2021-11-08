server {
    listen       80;
    listen  [::]:80;
    server_name  ${HOST};

    #access_log  /var/log/nginx/host.access.log  main;

    location / {
        root   /app/public;

        try_files $uri /index.php$is_args$args;
#        index  index.php;
    }

    #error_page  404              /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

    # proxy the PHP scripts to Apache listening on 127.0.0.1:80
    #
    #location ~ \.php$ {
    #    proxy_pass   http://127.0.0.1;
    #}

    # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
    #
    location ~ \.php$ {
        root           /app/public;

        try_files $uri /index.php$is_args$args;

        fastcgi_split_path_info  ^(.+\.php)(/.+)$;
        include fastcgi_params;

        fastcgi_index   index.php;
        fastcgi_pass   php:9000;
        fastcgi_param   PATH_INFO         $fastcgi_path_info;
        fastcgi_param   PATH_TRANSLATED   $document_root$fastcgi_path_info;
        fastcgi_param   SCRIPT_FILENAME   $document_root$fastcgi_script_name;
    }

    # deny access to .htaccess files, if Apache's document root
    # concurs with nginx's one
    #
    #location ~ /\.ht {
    #    deny  all;
    #}
}
