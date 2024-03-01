include:
  - cifen.addon
  - cifen.theme

cifen-dedicated:
  test.nop:
    - require:
      - sls: cifen.addon
      - sls: cifen.theme
