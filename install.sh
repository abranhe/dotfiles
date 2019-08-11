#!/bin/bash
#
# Main script.

# Import config
source './scripts/utils.sh'

# Run setup
run_setup() {
  message 'Starting setup...'
  './scripts/setup.sh'
  all_ok "$@"
}

# Run all installers
run_installers() {
  find . -mindepth 2 -name 'install.sh' | while read -r installer; do
    message "Run ${installer}..."
    ./"${installer}"
    all_ok "$@"
  done
}

main() {
  run_setup "$@"
  run_installers "$@"
}

main "$@"
