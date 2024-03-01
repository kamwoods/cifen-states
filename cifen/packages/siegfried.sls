include:
  - cifen.repos.siegfried

siegfried:
  pkg.installed:
    - require:
      - sls: cifen.repos.siegfried
