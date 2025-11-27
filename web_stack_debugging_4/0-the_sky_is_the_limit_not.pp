# Fix Nginx to handle high load by increasing file descriptor limits
exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/'
}

-> exec { 'nginx-restart':
  command => 'nginx -s reload',
  path    => '/usr/local/bin/:/usr/bin/:/usr/sbin/:/bin/'
}
