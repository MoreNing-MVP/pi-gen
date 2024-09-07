#!/bin/bash
set -e

# Define the target user's home directory
USER_HOME="$ROOTFS_DIR/home/$FIRST_USER_NAME"

# Ensure the .ssh directory exists
mkdir -p "$USER_HOME/.ssh"
chmod 700 "$USER_HOME/.ssh"

# Copy the existing SSH key files (ensure these paths are correct)
cp 'files/id_ed25519_morening' "$USER_HOME/.ssh/id_ed25519_morening"
cp 'files/id_ed25519_morening.pub' "$USER_HOME/.ssh/id_ed25519_morening.pub"

# Set the correct permissions
chmod 600 "$USER_HOME/.ssh/id_ed25519_morening"
chmod 644 "$USER_HOME/.ssh/id_ed25519_morening.pub"

# Add the public key to authorized_keys
cat "$USER_HOME/.ssh/id_ed25519_morening.pub" >> "$USER_HOME/.ssh/authorized_keys"
chmod 600 "$USER_HOME/.ssh/authorized_keys"

# Set correct ownership of the .ssh directory and its contents
chown -R "$TARGET_USER:$TARGET_USER" "$USER_HOME/.ssh"

# Start the ssh-agent in the background and add SSH key
eval "$(ssh-agent -s)"
ssh-add "$USER_HOME/.ssh/id_ed25519_morening"