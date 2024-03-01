include:
  - cifen.packages.python3
  - cifen.packages.git

cifen-python3-packages-dfxml:
  pip.installed:
    - name: git+https://github.com/dfxml-working-group/dfxml_python.git
    - bin_env: /usr/bin/python3
    - require:
      - sls: cifen.packages.python3
      - sls: cifen.packages.git

