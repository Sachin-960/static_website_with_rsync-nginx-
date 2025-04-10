#!/bin/bash

# Variables
WSL_STATIC_SITE=~/deploy-static-site
REMOTE_USER=ubuntu
REMOTE_HOST=3.80.72.35
REMOTE_PATH=/var/www/html
KEY_SRC="/mnt/c/Users/dayal/sshtest2"
KEY_DEST=~/.ssh/sshtest2

# Step 0: Prepare SSH key
echo "🔐 Copying SSH key to WSL..."
mkdir -p ~/.ssh
cp "$KEY_SRC" "$KEY_DEST"
chmod 600 "$KEY_DEST"

# Step 1: Copy static site from Windows to WSL
echo "📁 Copying static site from Windows to WSL..."
rm -rf "$WSL_STATIC_SITE"  # Clean up old files if exist
cp -r "/mnt/c/Users/dayal/Desktop/New Projects Devops/Static Site server/static-site" "$WSL_STATIC_SITE"

# Step 2: Deploy using rsync
echo "🚀 Deploying static site to $REMOTE_USER@$REMOTE_HOST..."
rsync -avz -e "ssh -i $KEY_DEST" "$WSL_STATIC_SITE/" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH"

# Final status
if [ $? -eq 0 ]; then
  echo "✅ Deployment successful!"
else
  echo "❌ Deployment failed. Please check the above logs."
fi
