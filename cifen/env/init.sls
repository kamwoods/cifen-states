include:
  - cifen.env.dot-local
  - cifen.env.etc
  - cifen.env.guymager-config 
  - cifen.env.lib
  - cifen.env.mountwinalias
  - cifen.env.sudoers
  - cifen.env.floppyconfig
  - cifen.env.ficlam
  - cifen.env.usr
  - cifen.env.vimrc
  - cifen.env.vim-support

cifen-env:
  test.nop:
    - name: cifen-env
    - require:
      - sls: cifen.env.dot-local
      - sls: cifen.env.etc
      - sls: cifen.env.guymager-config
      - sls: cifen.env.lib
      - sls: cifen.env.mountwinalias
      - sls: cifen.env.sudoers
      - sls: cifen.env.floppyconfig
      - sls: cifen.env.ficlam
      - sls: cifen.env.usr
      - sls: cifen.env.vimrc
      - sls: cifen.env.vim-support
