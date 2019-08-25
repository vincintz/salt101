ca:
  - self_signed: True
  - path: /etc/pki/
  - cert_file: /etc/pki/ca.crt
  - key_file: /etc/pki/ca.key

www:
  - root_dir: /var/www/html/site/
  - error_log: /var/www/html/site/error.log

openldap:
  rootdn: 'cn=root,dc=example,dc=com'
  rootpw: '{SSHA}d47vM4+elPmoYWVmnfOcmIqrGmloEyBz'
  base: 'dc=example,dc=com'
  user: 'openldap'
  group: 'openldap'
  slapd_services: 'ldap:/// ldaps:/// ldapi:///'
