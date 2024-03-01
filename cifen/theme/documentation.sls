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

{{ home }}/:
  file.recurse:
    - source: salt://cifen/theme/documentation/
    - user: {{ user }}
    - group: {{ group }}
    - makedirs: True
    - file_mode: keep
    - require:
      - user: cifen-user-{{ user }}
