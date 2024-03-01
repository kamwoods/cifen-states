{% set user = salt['pillar.get']('cifen_user', 'cifenadmin') %}

include:
  - cifen.config.user

sudoers:
  file.append:
    - name: /etc/sudoers.d/cifen
    - text:
      - "{{ user }} ALL=NOPASSWD: ALL\nDefaults env_keep += \"ftp_proxy http_proxy https_proxy no_proxy\""
    - makedirs: True
    - require:
      - user: cifen-user-{{ user }}
