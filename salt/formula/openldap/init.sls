openldap:
  pkg.installed:
    - pkgs:
      - openldap
      - openldap-servers
      - openldap-clients

/etc/sysconfig/slapd:
  file.managed:
    - source: salt://openldap/files/slapd.jinja
    - template: jinja
    - makedirs: True
    - show_changes: True
    - require:
      - pkg: httpd

/etc/openldap/ldap.conf:
  file.managed:
    - source: salt://openldap/files/ldap.conf.jinja
    - template: jinja
    - makedirs: True
    - show_changes: True
    - require:
      - pkg: httpd

openldap_service:
  service:
    - name: slapd
    - running
    - enable: True
    - require:
      - pkg: openldap

