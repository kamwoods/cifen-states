{%- set user = salt['pillar.get']('cifen_user', 'cifenadmin') -%}

{%- if user == "root" -%}
  {%- set home = "/root" -%}
{%- else %}
  {%- set home = "/home/" + user -%}
{%- endif -%}

include:
  - cifen.config.user
  - cifen.packages.gnome-sushi
  - cifen.packages.gnome-system-tools
  - cifen.packages.gnome-tweaks
  - cifen.packages.gnome-shell-extensions
  - cifen.packages.gnome-shell-extension-prefs

cifen-theme-applications-merged-dir:
  file.directory:
    - name: /etc/xdg/menus/applications-merged
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode
    - require:
      - sls: cifen.packages.gnome-sushi
      - sls: cifen.packages.gnome-system-tools
      - sls: cifen.packages.gnome-tweaks
      - sls: cifen.packages.gnome-shell-extensions
      - sls: cifen.packages.gnome-shell-extension-prefs

cifen-theme-menu-config-menus:
  file.recurse:
    - name: /etc/xdg/menus/applications-merged/
    - source: salt://cifen/theme/menu-config
    - include_pat: '*.menu'
    - user: root
    - group: root
    - file_mode: 644
    - require:
      - file: cifen-theme-applications-merged-dir

cifen-theme-menu-config-directories:
  file.recurse:
    - name: /usr/share/desktop-directories/
    - source: salt://cifen/theme/menu-config/
    - include_pat: '*.directory'
    - user: root
    - group: root
    - file_mode: 644
    - require:
      - file: cifen-theme-menu-config-menus

cifen-theme-applications-desktop-files:
  file.recurse:
    - name: /usr/share/applications/
    - source: salt://cifen/theme/menu-config/
    - include_path: '*.desktop'
    - user: root
    - group: root
    - file_mode: 644
    - require:
      - file: cifen-theme-menu-config-directories
