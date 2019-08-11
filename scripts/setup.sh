#!/bin/bash
#
# Setup all the things.

# Import config
source './scripts/utils.sh'

# Create bin folder and symlink content
setup_bin_folder() {
  message 'Setup bin folder and copy the files..'
  mkdir -p "$DEST/bin"
  for file in $DOTS/bin/*; do
    ln -sfn "$file" "$DEST/bin/"
  done
  all_ok "$@"
}

# Main function - wrap all things
main() {
  setup_bin_folder "$@"
}

main "$@"
