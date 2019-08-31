salt_x509_module:
  pkg.installed:
    - name: m2crypto
    - reload_modules: True
  file.directory:
    - name: {{ salt['pillar.get']('ca:path') }}
    - mode: 0600

ca_signing_key:
  x509.private_key_managed:
    - name: {{ salt['pillar.get']('ca:key_file') }}
    - bits: 1024
    - require:
      - file: salt_x509_module

ca_root_cert:
  x509.certificate_managed:
    - name: {{ salt['pillar.get']('ca:cert_file') }}
    - signing_private_key: {{ salt['pillar.get']('ca:key_file') }}
    - CN: {{grains['id']}}
    - C: PH
    - ST: Manila
    - L: Manila
    - O: Sample
    - OU: Sample
    - basicConstraints: "CA:true"
    - authorityKeyIdentifier: keyid,issuer:always
    - days_valid: 3650
    - days_remaining: 0
    - require:
      - x509: ca_signing_key
