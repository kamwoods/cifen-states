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

{{ home }}/.vimrc:
  file.managed:
    - source: salt://cifen/env/.vimrc
    - user: {{ user }}
    - group: {{ group }}
    - mode: 755
    - dir_mode: 755
