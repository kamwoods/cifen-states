{% set user = salt['pillar.get']('cifen_user', 'cifenadmin') %}

include:
  - cifen.config.user

cifen-xhost:
  cmd.run:
    - name: "xhost +"
    - shell: /bin/bash
    - require:
      - user: cifen-user-{{ user }}
