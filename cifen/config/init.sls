include:
  - cifen.config.user
  - cifen.config.timezone
  - cifen.config.salt-minion
  - cifen.config.ssh

cifen-config:
  test.nop:
    - name: cifen-config
    - require:
      - sls: cifen.config.user
      - sls: cifen.config.timezone
      - sls: cifen.config.salt-minion
      - sls: cifen.config.ssh
