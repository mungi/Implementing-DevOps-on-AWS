#!/bin/bash

set -euf -o pipefail
exec 1> >(logger -s -t $(basename $0)) 2>&1

# Install SaltStack
yum -y install https://repo.saltstack.com/yum/amazon/salt-amzn-repo-2016.11-1.amzn1.noarch.rpm
yum clean expire-cache; yum -y install salt-minion; chkconfig salt-minion off

# Put custom grains in place
echo -e 'grains:\n roles:\n  - demo-app' > /etc/salt/minion.d/grains.conf
