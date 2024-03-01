/usr/local/bin/cifen_mounter.py:
  file.managed:
    - source: salt://cifen/mounter/cifen_mounter.py
    - user: root
    - group: root
    - mode: 755
