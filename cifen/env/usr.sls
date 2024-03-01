/usr:
  file.recurse:
    - source: salt://cifen/env/usr
    - user: root
    - group: root
    - makedirs: True
    - file_mode: 755
    - dir_mode: 755
