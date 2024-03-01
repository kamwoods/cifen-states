include:
  - cifen.packages.python3

openpyxl:
  pip.installed:
    - bin_env: /usr/bin/python3
    - upgrade: True
    - require:
      - sls: cifen.packages.python3
