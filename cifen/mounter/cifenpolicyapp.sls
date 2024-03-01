/usr/local/bin/cifen_policyapp.py:
  file.managed:
    - source: salt://cifen/mounter/cifen_policyapp.py
    - user: root
    - group: root
    - mode: 755
