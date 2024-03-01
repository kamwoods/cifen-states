include:
  - cifen.mounter.cifenmounter
  - cifen.mounter.cifenpolicyapp
  - cifen.mounter.cifenautostart

cifen-mounter:
  test.nop:
    - name: cifen-mounter
    - require:
      - sls: cifen.mounter.cifenmounter
      - sls: cifen.mounter.cifenpolicyapp
      - sls: cifen.mounter.cifenautostart
