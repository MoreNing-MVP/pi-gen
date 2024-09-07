#!/bin/bash
set -e

./scripts/setup-audio.sh
./scripts/copy-ssh-keys.sh
./scripts/install-firmware.sh
./scripts/setup-access-point.sh
./scripts/setup-startup.sh