![Logo](https://github.com/kamwoods/cifen-states/blob/main/cifen/env/usr/share/cifen/resources/images/CIFEN-Base-Logo-96x96.png)

# cifen-states

[![GitHub issues](https://img.shields.io/github/issues/kamwoods/cifen-states.svg)](https://github.com/kamwoods/cifen-states/issues)
[![GitHub forks](https://img.shields.io/github/forks/kamwoods/cifen-states.svg)](https://github.com/kamwoods/cifen-states/network)

**CIFEN is experimental. Included tools, scripts, desktop configuration, and build procedures may change frequently.**

CIFEN is an environment designed to assist with digital preservation and data recovery tasks. It is built with Cast (https://github.com/ekristen/cast) and designed to be deployed in Ubuntu LTS releases.

## Installation

**1. Install Ubuntu 22.04LTS**

Once installed, boot the system and log in. Open a terminal, and install cast using the following commands:

```
wget https://github.com/ekristen/cast/releases/download/v0.14.22/cast-v0.14.22-linux-amd64.deb
sudo dpkg -i cast-v0.14.22-linux-amd64.deb
```

(Note: More recent releases of should also work)

**2. Install CIFEN with the following command:**

```
sudo cast install kamwoods/cifen-states
```

**3. Reboot the system.**

```
sudo reboot
```

## License(s)

This software is distributed under the terms of the MIT License. See the LICENSE file for additional details.

