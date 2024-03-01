include:
  - cifen.repos.ubuntu-multiverse
  - cifen.repos.ubuntu-universe
  - cifen.repos.docker
  - cifen.repos.siegfried

cifen-repos:
  test.nop:
    - name: cifen-repos
    - require:
      - sls: cifen.repos.ubuntu-multiverse
      - sls: cifen.repos.ubuntu-universe
      - sls: cifen.repos.docker
      - sls: cifen.repos.siegfried
