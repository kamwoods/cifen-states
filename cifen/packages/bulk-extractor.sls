{% set files = ['build_stoplist.py', 'bulk_diff.py', 'cda_tool.py', 'post_process_exif.py'] %}
{% if grains['oscodename'] == 'focal' %}
  {% set py_ver = 'python3.8' %}
{% elif grains['oscodename'] == 'jammy' %}
  {% set py_ver = 'python3.10' %}
{% endif %}

include:
  - cifen.packages.build-essential
  - cifen.packages.libssl-dev
  - cifen.packages.flex
  - cifen.packages.libewf
  - cifen.packages.libewf-dev
  - cifen.packages.libexpat1-dev
  - cifen.packages.libre2-dev
  - cifen.packages.libxml2-utils
  - cifen.packages.libtool
  - cifen.packages.pkg-config
  - cifen.packages.zlib1g-dev
  - cifen.packages.make
  - cifen.packages.git

bulk-extractor-source:
  git.latest:
    - name: https://github.com/simsong/bulk_extractor
    - target: /usr/local/src/bulk_extractor
    - user: root
    - rev: v2.1.0
    - submodules: True
    - force_clone: True
    - force_reset: True
    - require:
      - sls: cifen.packages.build-essential
      - sls: cifen.packages.libssl-dev
      - sls: cifen.packages.flex
      - sls: cifen.packages.libewf
      - sls: cifen.packages.libewf-dev
      - sls: cifen.packages.libexpat1-dev
      - sls: cifen.packages.libre2-dev
      - sls: cifen.packages.libxml2-utils
      - sls: cifen.packages.libtool
      - sls: cifen.packages.pkg-config
      - sls: cifen.packages.zlib1g-dev
      - sls: cifen.packages.make
      - sls: cifen.packages.git

bulk-extractor-build:
  cmd.run:
    - names:
      - ./bootstrap.sh
      - ./configure
      - make -s
      - make install -s
    - cwd: /usr/local/src/bulk_extractor
    - require:
      - git: bulk-extractor-source

{% for file in files %}

bulk-extractor-{{ file }}:
  file.managed:
    - name: /usr/local/bin/{{ file }}
    - source: /usr/local/src/bulk_extractor/python/{{ file }}
    - user: root
    - group: root
    - makedirs: True
    - mode: 0755
    - require:
      - git: bulk-extractor-source

{% endfor %}

bulk-extractor-identify-filenames:
  file.managed:
    - name: /usr/local/bin/identify_filenames.py
    - source: salt://cifen/files/identify_filenames.py
    - user: root
    - group: root
    - mode: 0755
    - require:
      - git: bulk-extractor-source

bulk-extractor-bulk-extractor-reader:
  file.managed:
    - name: /usr/local/lib/{{ py_ver }}/dist-packages/bulk_extractor_reader.py
    - source: /usr/local/src/bulk_extractor/python/bulk_extractor_reader.py
    - user: root
    - group: root
    - makedirs: True
    - mode: 0644
    - require:
      - git: bulk-extractor-source

bulk-extractor-cleanup:
  file.absent:
    - name: /usr/local/src/bulk_extractor
    - require:
      - cmd: bulk-extractor-build
