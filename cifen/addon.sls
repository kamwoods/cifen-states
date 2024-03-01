include:
  - cifen.repos
  - cifen.packages
  - cifen.python3-packages
  - cifen.config
  - cifen.env
  - cifen.tools
  - cifen.mounter

cifen-version-file:
  file.managed:
    - name: /etc/cifen-version
    - source: salt://cifen/VERSION
    - user: root
    - group: root
    - require:
      - sls: cifen.repos
      - sls: cifen.packages
      - sls: cifen.python3-packages
      - sls: cifen.config
      - sls: cifen.env
      - sls: cifen.tools
      - sls: cifen.mounter
