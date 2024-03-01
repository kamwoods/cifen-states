#!/bin/bash

set -x

DISTRO=${DISTRO:="focal"}
STATE=$1

docker run -it --rm --name="cifen-state-${STATE}" -v `pwd`/cifen:/srv/salt/cifen --cap-add SYS_ADMIN kamwoods/cifen-salt-tester:${DISTRO} \
  salt-call -l debug --local --retcode-passthrough --state-output=mixed state.sls ${STATE} pillar="{cifen_user: cifenadmin}"
