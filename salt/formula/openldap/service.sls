openldap_service:
  service.running:
    - name: slapd
    - enable: True
    - require:
      - openldap
