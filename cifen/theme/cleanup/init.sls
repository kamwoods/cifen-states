{%- set user = salt['pillar.get']('cifen_user', 'cifenadmin') -%}

include:
  - cifen.packages.docker

cifen-theme-cleanup-extra-apps:
  pkg.removed:
    - pkgs:
      - aisleriot
      - avahi-daemon
      - transmission
      - caffeine
      - cheese
      - gnome-mahjongg
      - gnome-mines
      - rhythmbox
      - gnome-sudoku
      - unattended-upgrades
      - transmission-gtk
      - gnome-2048
      - yelp

cifen-theme-cleanup-disable-auto-upgrades:
  file.append:
    - name: /etc/apt/apt.conf.d/20auto-upgrades
    - text: "APT::Periodic::Update-Package-Lists \"0\";\nAPT::Periodic::Unattended-Upgrade \"0\";"
    - makedirs: True

{%- if salt['file.file_exists']('/sbin/runlevel') %}

cifen-theme-cleanup-service-bluetooth:
  service.dead:
    - name: bluetooth
    - enable: False

cifen-theme-cleanup-service-docker:
  service.dead:
    - name: docker
    - enable: False
    - require:
      - sls: cifen.packages.docker

cifen-theme-cleanup-docker-wrapper:
  file.managed:
    - replace: False
    - user: root
    - group: root
    - mode: 755
    - name: /usr/local/bin/docker
    - source: salt://cifen/theme/cleanup/docker-wrapper.sh
    - makedirs: True
    - require:
      - sls: cifen.packages.docker

{% endif %}

cifen-theme-cleanup-autoremove:
  cmd.run:
    - name: apt-get autoremove -y --purge
