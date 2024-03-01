{% set user = salt['pillar.get']('cifen_user', 'cifenadmin') %}
{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user %}
{% endif %}
{% set all_users = salt['user.list_users']() %}
{% if user in all_users %}
  {% set group = salt['cmd.run']('id -gn ' + user) %}
{% else %}
  {% set group = user %}
{% endif %}

include:
  - cifen.config.user

cifen-theme-config:
  file.managed:
      - name: /usr/share/cifen/cifen-theme.sh
      - source: salt://cifen/theme/cifen-theme.sh
      - mode: 755
      - makedirs: True

cifen-theme-config-autostart:
  file.managed:
    - replace: False
    - user: {{ user }}
    - group: {{ group }}
    - name: {{ home }}/.config/autostart/cifen-theme.desktop
    - source: salt://cifen/theme/cifen-theme.desktop
    - makedirs: True
    - require:
      - user: cifen-user-{{ user }}
      - file: cifen-theme-config
