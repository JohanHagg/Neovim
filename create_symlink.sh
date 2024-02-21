# #!/bin/bash

# Exit immediately if any command fails
set -e

# Get the absolute path of the script
SCRIPT_PATH=$(dirname "$(readlink -f "$0")")/nvim

ln -s ${SCRIPT_PATH} ~/.config/nvim

echo "Created symlink to: $SCRIPT_PATH"

