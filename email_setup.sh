#!/bin/bash

HOOK_NAME=$(basename "$0")
repo_path=$(git rev-parse --show-toplevel)

if [[ "$repo_path" == *"/dev/github/"* ]]; then
  git config --local user.email $(op read "op://personal/me/git/email")
elif [[ "$repo_path" == *"/dev/gitlab/"* ]]; then
  git config --local user.email $(op read "op://excel/me/git/email")
fi

# If there is local hook, run it
if [ -f "$repo_path/.git/hooks/$HOOK_NAME" ]; then
  "$repo_path/.git/hooks/$HOOK_NAME"
fi
