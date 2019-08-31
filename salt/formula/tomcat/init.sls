tomcat8_stopped:
  cmd.run:
    - name: '/opt/tomcat8/apache-tomcat-8.5.45/bin/catalina.sh stop'
    - user: vagrant
    - onlyif: 'test -f /opt/tomcat8/apache-tomcat-8.5.45/bin/catalina.sh'

tomcat8:
  archive.extracted:
    - name: /opt/tomcat8
    - source: http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.45/bin/apache-tomcat-8.5.45.tar.gz
    - source_hash: http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.45/bin/apache-tomcat-8.5.45.tar.gz.sha512

tomcat8_keyfile:
  cmd.run:
    - name: openssl pkcs12 -export -in {{ salt['pillar.get']('ca:cert_file') }} -inkey {{ salt['pillar.get']('ca:key_file') }} -out {{ salt['pillar.get']('tomcat:key_file') }} -name tomcat -password pass:{{ salt['pillar.get']('tomcat:key_pass') }}
    - cwd: /opt/tomcat8/apache-tomcat-8.5.45

tomcat8_config:
  file.managed:
    - name: /opt/tomcat8/apache-tomcat-8.5.45/conf/server.xml
    - source: salt://tomcat/files/server.xml.jinja
    - template: jinja
    - makedirs: True
    - show_changes: True

tomcat8_permission:
  file.directory:
    - name: /opt/tomcat8
    - user: vagrant
    - group: vagrant
    - recurse:
      - user
      - group

# TODO: Sort out user issue for non-vagrant install
# suggestion: create user: appuser
# tomcat8_started:
#   cmd.run:
#     - name: '/opt/tomcat8/apache-tomcat-8.5.45/bin/catalina.sh start'
#     - user: vagrant
#     - bg: True
