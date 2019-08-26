httpd:
  pkg:
    - installed
    - name: httpd

mod_ssl:
  pkg:
    - installed
    - require:
      - pkg: httpd

web_root:
  file.managed:
    - name: /var/www/html/site/index.html
    - source: salt://httpd/files/index.html.jinja
    - template: jinja
    - makedirs: True
    - show_changes: True

site_conf:
  file.managed:
    - name: /etc/httpd/conf.d/site-ssl.conf
    - source: salt://httpd/files/site-ssl.conf.jinja
    - template: jinja
    - makedirs: True
    - show_changes: True

httpd_service:
  service:
    - name: httpd
    - running
    - enable: True
