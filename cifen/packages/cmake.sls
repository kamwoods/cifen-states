include:
  - cifen.repos.kitware

cmake:
  pkg.installed:
    - allow_updates: True
    - upgrade: True
    - require:
      - sls: cifen.repos.kitware
