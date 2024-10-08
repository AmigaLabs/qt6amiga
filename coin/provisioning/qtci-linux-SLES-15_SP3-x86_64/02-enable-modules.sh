#!/usr/bin/env bash

set -ex

sudo curl http://repo-clones.ci.qt.io:8081/tools/rmt-client-setup --output rmt-client-setup
sudo chmod 755 rmt-client-setup
sudo SUSEConnect --cleanup
sudo sh rmt-client-setup https://repo-clones.ci.qt.io:8082 --yes --fingerprint 80:90:7F:45:C6:DF:45:8A:57:25:1E:17:5E:D7:E3:6E:96:1B:1B:95

# Activate these modules
sudo SUSEConnect -p sle-module-basesystem/15.3/x86_64
sudo SUSEConnect -p sle-module-server-applications/15.3/x86_64
sudo SUSEConnect -p sle-module-desktop-applications/15.3/x86_64
sudo SUSEConnect -p sle-module-development-tools/15.3/x86_64
sudo SUSEConnect -p sle-module-python2/15.3/x86_64

sudo zypper lr -u
