upstream indreniserver {
    server ${INDRENI_HOST}:${INDRENI_PORT};
}


server {
    listen ${LISTEN_PORT};

    location /static {
        alias /vol/static;

    }

    location / {
        proxy_pass             http://indreniserver;
        include                /etc/nginx/uwsgi_params;
        client_max_body_size   10M;
    }
}