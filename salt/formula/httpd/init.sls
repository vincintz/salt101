httpd:
  pkg:
    - installed
    - name: httpd

mod_ssl:
  pkg:
    - installed
    - require:
      - pkg: httpd

httpd:
  service:
    - running
    - enable: True
    - require:
      - pkg: mod_ssl


web_root:
  file.managed:
    - name: /var/www/html/site/index.html
    - source: salt://httpd/files/index.html.jinja
    - template: jinja
    - makedirs: True
    - show_changes: True
    - require:
      - pkg: httpd

site_conf:
  file.managed:
    - name: /etc/httpd/conf.d/site-ssl.conf
    - source: salt://httpd/files/site-ssl.conf.jinja
    - template: jinja
    - makedirs: True
    - show_changes: True
    - require:
      - file: web_root
