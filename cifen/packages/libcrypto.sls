{% if grains['oscodename'] == 'jammy' %}

libcrypto++8:
  pkg.installed

{% elif grains['oscodename'] == 'noble' %}

libcrypto++8:
  pkg.installed

{% endif %}
