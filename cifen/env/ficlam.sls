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
  - cifen.packages.sleuthkit

ficlam-config:
  file.directory:
    - name: {{ home }}/.fiwalk
    - user: {{ user }}
    - group: {{ group }}
    - file_mode: 755
    - dir_mode: 755
    - makedirs: True
    - require:
      - user: cifen-user-{{ user }}

ficlam-script:
  file.managed:
    - name: {{ home }}/.fiwalk/ficlam.sh
    - source: salt://cifen/files/ficlam.sh
    - user: {{ user }}
    - group: {{ group }}
    - mode: 755
    - require:
      - sls: cifen.packages.sleuthkit
