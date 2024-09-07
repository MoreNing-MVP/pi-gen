#!/bin/bash

cd "$ROOTFS_DIR/home/$FIRST_USER_NAME/good_morning_project"
local_ip=\$(ip -4 -o addr show scope global | awk '{gsub(/\/.*/, ""); print \$4; exit}')

while true; do
    sleep 15
    source .venv/bin/activate
    python app.py
    exit_code=\$?
    if [ \$exit_code -eq 0 ]; then
        break
    else
        echo "Command failed. Retrying in 10 seconds..."
        sleep 10
    fi
done