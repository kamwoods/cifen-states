#!/bin/bash
echo "salt-call -l debug --local --retcode-passthrough --state-output=mixed state.sls cifen.  pillar='{\"cifen_user\": \"cifenadmin\"}' --log-file=/saltstack.log --log-file-level=debug --out-file=/saltstack.log --out-file-append"
set -x

DISTRO=${DISTRO:="focal"}
STATE=$1

docker run -it --rm --name="cifen-state-${DISTRO}" -v `pwd`/cifen:/srv/salt/cifen --cap-add SYS_ADMIN kamwoods/cifen-tester:${DISTRO} \
  /bin/bash
