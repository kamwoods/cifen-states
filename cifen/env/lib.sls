/lib:
  file.recurse:
    - source: salt://cifen/env/lib
    - user: root
    - group: root
    - makedirs: True
    - file_mode: keep
