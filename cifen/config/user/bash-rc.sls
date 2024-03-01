{% set user = salt['pillar.get']('cifen_user', 'cifenadmin') %}

rc-noclobber:
  file.append:
    - name: /home/{{ user }}/.bashrc
    - text: 'set -o noclobber'

rc-root-noclobber:
  file.append:
    - name: /root/.bashrc
    - text: 'set -o noclobber'
