/etc/sysconfig/slapd:
  file.managed:
    - source: salt://openldap/files/slapd.jinja
    - template: jinja
    - makedirs: True
    - show_changes: True
    - require:
      - openldap

/etc/openldap/ldap.conf:
  file.managed:
    - source: salt://openldap/files/ldap.conf.jinja
    - template: jinja
    - makedirs: True
    - show_changes: True
    - require:
      - openldap
