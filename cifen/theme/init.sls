include:
  - cifen.packages.gnome-sushi
  - cifen.packages.gnome-system-tools
  - cifen.packages.gnome-tweaks
  - cifen.packages.gnome-shell-extensions
  - cifen.packages.gnome-shell-extension-prefs
  - cifen.packages.nautilus-script-audio-convert
  - cifen.packages.nautilus-scripts-manager
  - cifen.theme.cifen-theme
  - cifen.theme.documentation
  - cifen.theme.menu-config
  - cifen.theme.xhost
  - cifen.theme.terminal
  - cifen.theme.mediasymlink
  - cifen.packages.open-vm-tools-desktop
  - cifen.theme.cleanup

cifen-theme:
  test.nop:
    - name: cifen-theme
    - require:
      - sls: cifen.packages.gnome-sushi
      - sls: cifen.packages.gnome-system-tools
      - sls: cifen.packages.gnome-tweaks
      - sls: cifen.packages.gnome-shell-extensions
      - sls: cifen.packages.gnome-shell-extension-prefs
      - sls: cifen.packages.nautilus-script-audio-convert
      - sls: cifen.packages.nautilus-scripts-manager
      - sls: cifen.theme.cifen-theme
      - sls: cifen.theme.documentation
      - sls: cifen.theme.menu-config
      - sls: cifen.theme.xhost
      - sls: cifen.theme.terminal
      - sls: cifen.theme.mediasymlink
      - sls: cifen.packages.open-vm-tools-desktop
      - sls: cifen.theme.cleanup
