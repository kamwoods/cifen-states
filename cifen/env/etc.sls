/etc:
  file.recurse:
    - source: salt://cifen/env/etc
    - user: root
    - group: root
    - makedirs: True
    - file_mode: keep
