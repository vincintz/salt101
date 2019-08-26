ca:
  - self_signed: True
  - path: /etc/pki/
  - cert_file: /etc/pki/ca.crt
  - key_file: /etc/pki/ca.key

www:
  - root_dir: /var/www/html/site/
  - error_log: /var/www/html/site/error.log

tomcat:
  http_port: 8080
  https_port: 8443
  key_file: conf/ca.p12
  key_pass: changeit
