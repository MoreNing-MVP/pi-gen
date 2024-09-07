#!/bin/bash
set -e

USER_HOME="$ROOTFS_DIR/home/$FIRST_USER_NAME"
FIRMWARE_DIR="$USER_HOME/good_morning_project"

git clone --branch 'git@github.com:noam95/good_morning_project.git' "$FIRMWARE_DIR"
cd "$FIRMWARE_DIR"

git checkout release/latest

python3 -m venv --system-site-packages '.venv'
source '.venv/bin/activate'
pip install -r 'requirements.txt'
