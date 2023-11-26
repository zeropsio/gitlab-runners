#!/bin/bash

if [ -f 'initialized' ]; then exit 0; fi

if [ -f 'initializing' ]; then echo 'Initialization failed'; exit 1; fi
touch 'initializing'

init_script=init_$1.sh

apt update && apt install -y git zip gcc bzr

echo 'Initializing runner profile'
sudo -u gitlab-runner -HE -- bash -x /var/www/init_runner.sh

echo 'Initializing runner technology'
sudo bash -x /var/www/"$init_script"

chown -R gitlab-runner:gitlab-runner /home/gitlab-runner/

echo 'Starting and registering runner'
gitlab-runner start
gitlab-runner register --non-interactive --url "${GITLAB_URL?:}" --token "${GITLAB_TOKEN?:}" --executor shell --name "${ZEROPS_StackName?:}-${ZEROPS_Number?:}"

echo 'Done'

touch 'initialized'
rm -f 'initializing'
