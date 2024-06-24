#!/bin/bash

set -euxo pipefail

# This script is used to do a quick change
# Usage: qc.sh "Issue number" "Description"

ISSUE_NUMBER=$1
DESCRIPTION=$2

# Validate input
if [ -z "$ISSUE_NUMBER" ]; then
    echo "Issue number is required"
    exit 1
fi

# Description cannot have special characters except "-"
if [[ ! "$DESCRIPTION" =~ ^[a-zA-Z0-9\ -]+$ ]]; then
    echo "Description can only have alphabets, numbers, and hyphen"
    exit 1
fi

# Reset to root directory
cd "$(git rev-parse --show-toplevel || echo .)"

# Stash all change
git stash --include-untracked

# Checkout to main branch
git checkout main

# Pull latest changes
git pull

# Checkout to the branch
DESCRIPTION_HYPHEN=$(echo $DESCRIPTION | tr ' ' '-')
git checkout -b "feature/$ISSUE_NUMBER-$DESCRIPTION_HYPHEN"

# Apply the stash
git stash pop

# Commit the changes
git add .
git commit -m "feat: $ISSUE_NUMBER - $DESCRIPTION"

# Push the changes
git push --set-upstream origin "feature/$ISSUE_NUMBER-$DESCRIPTION_HYPHEN"

# Open the PR
gh pr create --title "feat: $ISSUE_NUMBER - $DESCRIPTION" --body "Closes #$ISSUE_NUMBER" --base main