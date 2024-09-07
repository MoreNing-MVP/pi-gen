#!/bin/bash
set -e

USER_HOME="$ROOTFS_DIR/home/$FIRST_USER_NAME"
START_SCRIPT_PATH="$USER_HOME/api_startup_script.sh"

cp "files/startup-script.sh" "$START_SCRIPT_PATH"
chmod +x "$START_SCRIPT_PATH"

cp "files/morening.service" '/lib/systemd/system/morening.service'

sudo systemctl daemon-reload
sudo systemctl enable morening.service
sudo systemctl start morening.service