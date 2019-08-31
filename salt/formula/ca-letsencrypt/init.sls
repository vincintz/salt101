# package installed
letsencrypt-installed:
  pkg.installed:
    - pkgs:
      - epel-release
      - yum-utils
      - certbot
      - python2-certbot-apache 

# remove apache ssl config
apache-ssl-conf-clean:
  cmd.run:
    - name: rm -f /etc/httpd/conf.d/*ssl*.conf

# TODO: call certbot