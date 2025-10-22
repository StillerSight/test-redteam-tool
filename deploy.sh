#!/bin/bash

# change permissions
# chmod +x deploy.sh

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Determine script directory ---
# This ensures paths work even if the script is run from another directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- Configuration ---
# Path to your Ansible playbook
PLAYBOOK="$SCRIPT_DIR/ansible/deploy_persistence.yml"

# Path to your Ansible inventory file (optional)
INVENTORY="$SCRIPT_DIR/ansible/inventory.ini"

# Extra variables to pass to the playbook (optional)
# EXTRA_VARS="key1=value1 key2=value2"

# --- Pre-deployment actions (optional) ---
echo "Starting deployment..."
# Example: Ensure required dependencies are met
command -v ansible >/dev/null 2>&1 || { echo >&2 "Ansible is not installed. Aborting."; exit 1; }

# --- Run the Ansible Playbook ---
echo "Running Ansible playbook: $PLAYBOOK"

# Execution with inventory and extra variables (uncomment and modify as needed)
ansible-playbook -i "$INVENTORY" "$PLAYBOOK"

# --- Post-deployment actions (optional) ---
echo "Deployment completed successfully."
# rm -f /tmp/some_temp_file

exit 0
