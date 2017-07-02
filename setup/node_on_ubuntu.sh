#!/bin/sh

set -euo pipefail

wget -qO- https://deb.nodesource.com/setup_7.x | sudo bash -
sudo apt-get install -y nodejs
