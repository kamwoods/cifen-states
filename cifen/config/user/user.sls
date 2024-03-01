{% set user = salt['pillar.get']('cifen_user', 'cifenadmin') %}
{% set group = salt['pillar.get']('cifen_group', user) %}
{% if user == "root" %}
  {% set home = "/root" %}
{% else %}
  {% set home = "/home/" + user %}
{% endif %}
{% set all_users = salt['user.list_users']() %}
{% if user in all_users %}
cifen-user-{{ user }}:
  user.present:
    - name: {{ user }}
    - home: {{ home }}
{% else %}
cifen-user-{{ user }}:
  group.present:
    - name: {{ user }}
  user.present:
    - name: {{ user }}
    - gid: {{ group }}
    - fullname: CIFENAdmin
    - shell: /bin/bash
    - home: {{ home }}
    - password: $6$xyz$MupamTWNaNx5O.weIQ3PD0qubs.VFMVRc2qMV5bdv5OAj9gSk1mMf4lcRXUNgOip507Kx5uZ1yD9cZSEHXGOT0
{% endif %}
