server {
    listen 8585;
    server_name localhost;

    access_log /var/log/nginx/proxy_access.log;
    error_log /var/log/nginx/proxy_error.log;

     location ~ ^/(.*)$ {
        proxy_pass http://127.0.0.1:8500/$1$is_args$args;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
