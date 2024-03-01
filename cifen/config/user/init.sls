include:
  - cifen.config.user.user
  - cifen.config.user.bash-rc
  - cifen.config.user.folders

cifen-config-user:
  test.nop:
    - name: cifen-config-user
    - require:
      - sls: cifen.config.user.user
      - sls: cifen.config.user.bash-rc
      - sls: cifen.config.user.folders
