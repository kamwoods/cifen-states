#!/bin/bash

docker run -it --rm --name="cifen-test-all" -v `pwd`/bitcurator:/srv/salt/cifen --cap-add SYS_ADMIN kamwoods/cifen-salt-tester:jammy:noble \
  salt-call -l info --local --retcode-passthrough --state-output=mixed state.sls cifen pillar='{"cifen_user": "cifenadmin"}'
