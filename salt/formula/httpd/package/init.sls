# http://mirror.centos.org/centos/7/sclo/x86_64/rh/httpd24/httpd24-httpd-2.4.34-7.el7.x86_64.rpm
httpd:
  pkg.installed

mod_ssl:
  pkg.installed:
    - require:
      - pkg: httpd
