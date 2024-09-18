{% if grains['oscodename'] == 'jammy' %}

libdvdread8:
  pkg.installed

{% elif grains['oscodename'] == 'noble' %}

libdvdread8:
  pkg.installed

{% endif %}
