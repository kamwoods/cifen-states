include:
  - cifen.packages.python3

fpdf2:
  pip.installed:
    - bin_env: /usr/bin/python3
    - require:
      - sls: cifen.packages.python3
