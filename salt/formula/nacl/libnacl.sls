libnacl:
  pip.installed:
    - name: libnacl
    - require:
      - pkg: pip_installed