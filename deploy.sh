#!/bin/bash

# change permissions
# chmod +x deploy.sh

# Exit immediately if a command exits with a non-zero status.
set -e

# script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLAYBOOK="$SCRIPT_DIR/ansible/deploy_persistence.yml"
INVENTORY="$SCRIPT_DIR/ansible/inventory.ini"
LOG_FILE="$SCRIPT_DIR/deployment.log"
echo "Starting deployment..."
# command -v ansible >/dev/null 2>&1 || { echo >&2 "Ansible is not installed. Aborting."; exit 1; }
ansible-playbook -i "$INVENTORY" "$PLAYBOOK" | tee "$LOG_FILE"

exit 0
