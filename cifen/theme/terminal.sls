{% set user = salt['pillar.get']('cifen_user', 'cifenadmin') %}
{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user %}
{% endif %}

include:
  - cifen.config.user.user
  - cifen.theme.xhost
  - cifen.packages.dbus-x11

cifen-theme-terminal-profile-file:
  file.managed:
    - name: /usr/share/cifen/resources/terminal-profile-dark.txt
    - source: salt://cifen/theme/terminal-profile-dark.txt
    - user: root
    - group: root
    - mode: 0644
    - makedirs: True

cifen-dbus-address:
  cmd.run:
    - name: export DBUS_SESSION_BUS_ADDRESS=$(dbus-launch | grep DBUS_SESSION_BUS_ADDRESS | cut -d= -f2-)
    - shell: /bin/bash
    - runas: {{ user }}
    - cwd: {{ home }}
    - require:
      - user: cifen-user-{{ user }}
      - sls: cifen.theme.xhost
      - sls: cifen.packages.dbus-x11

cifen-theme-terminal-profile-install:
  cmd.run:
    - name: dconf load /org/gnome/terminal/legacy/profiles:/ < /usr/share/cifen/resources/terminal-profile-dark.txt
    - runas: {{ user }}
    - cwd: {{ home }}
    - shell: /bin/bash
    - require:
      - file: cifen-theme-terminal-profile-file
      - user: cifen-user-{{ user }}
      - sls: cifen.theme.xhost
      - cmd: cifen-dbus-address
    - watch:
      - file: cifen-theme-terminal-profile-file
      - sls: cifen.theme.xhost
      - cmd: cifen-dbus-address
