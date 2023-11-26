a#!/bin/bash

sudo -u gitlab-runner curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain 1.65
