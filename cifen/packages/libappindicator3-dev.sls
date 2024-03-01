include:
  - cifen.packages.libappindicator3-1

libappindicator3-dev:
  pkg.installed:
    - require:
      - sls: cifen.packages.libappindicator3-1
