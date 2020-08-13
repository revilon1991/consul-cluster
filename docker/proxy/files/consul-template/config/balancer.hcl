consul {
  address = "127.0.0.1:8500"

  retry {
    enabled  = true
    attempts = 12
    backoff  = "250ms"
  }
}
template {
  source      = "/etc/consul-template.d/template/balancer.ctmpl"
  destination = "/etc/nginx/conf.d/balancer.conf"
  perms       = 0644
  command     = "nginx -s reload"
}
