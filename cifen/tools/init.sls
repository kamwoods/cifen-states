include:
  - cifen.tools.hfsexplorer
  - cifen.tools.dumpfloppy
  - cifen.tools.nsrllookup

cifen-tools:
  test.nop:
    - name: cifen-tools
    - require:
      - sls: cifen.tools.hfsexplorer
      - sls: cifen.tools.dumpfloppy
      - sls: cifen.tools.nsrllookup
