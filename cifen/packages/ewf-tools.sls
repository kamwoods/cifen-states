include:
  - cifen.packages.libewf2
  - cifen.packages.libewf-dev

ewf-tools:
  pkg.installed:
    - requires:
      - sls: cifen.packages.libewf2
      - sls: cifen.packages.libewf-dev
