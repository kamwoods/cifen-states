{% if grains['oscodename'] == 'jammy' %}

gadmin-rsync-not-in-jammy:
  test.nop

{% else %}

gadmin-rsync:
  pkg.installed

{% endif %}
