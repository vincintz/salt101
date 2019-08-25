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

tomcat8_permission:
  file.directory:
    - name: /opt/tomcat8
    - user: vagrant
    - group: vagrant
    - recurse:
      - user
      - group
    - require:
      - archive: tomcat8

tomcat8_started:
  cmd.run:
    - name: '/opt/tomcat8/apache-tomcat-8.5.45/bin/catalina.sh start'
    - user: vagrant
    - bg: True
