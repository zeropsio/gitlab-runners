# Zerops GitLab runners

## Import
- TODO
- Each different service runner type has to be imported separately (one service can not contain e.g. Node and GO runners)
- TODO

## Deploy scripts

Everything inside the `deploy` folder will be deployed to the runner container.

Main script run during initialization is `init.sh`.
It is used to install global requirements common for all runners that need higher privileges. It also runs:

1. `init_runner.sh` which is used to run different commands under `gitlab-runner` user (e.g. initializing the user profile).
2. `init_{technology}.sh` which is used for additional setup specific to the technology runner is being used for
