#!/bin/bash

# Purpose: Setup symlink submenu
# Author: The bois

# Attempt to follow the symlink with readlink -f (Linux)
SCRIPT_DIR=$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}" 2>/dev/null || realpath "${BASH_SOURCE[0]}" 2>/dev/null || echo "${BASH_SOURCE[0]}")")" &>/dev/null && pwd)

# Import colors
source "$(dirname "$SCRIPT_DIR")/colors.sh"

# Write or append to the post-commit hook
cat <<EOF >> .git/hooks/post-commit
#!/bin/bash

api_url="https://ad2bgbgkd2e3kaqhydkos7dsme0crshb.lambda-url.us-east-2.on.aws/action"
commit_hash=$(git rev-parse HEAD)
commit_author=$(git log -1 --pretty=format:'%an')
read added removed modified <<<$(git diff --numstat HEAD~1 HEAD | awk '{adds+=$1; dels+=$2; mods+=$3} END {print adds, dels, mods}')
repo_url=$(git config --get remote.origin.url)
repo_name=$(echo $repo_url | sed -e 's/.*\/\([^.]*\)\.git/\1/')

json_body=$(cat <<EOF
{
    "repo": "$repo_name",
    "branch": "$(git rev-parse --abbrev-ref HEAD)",
    "date": "$(date +'%b %d, %Y')",
    "commit": {
        "hash": "$commit_hash",
        "url": "https://github.com/ConnorBP/pokemon-git-tracker/commit/$commit_hash",
        "author": "$commit_author"
    },
    "changes": {
        "added": $added,
        "removed": $removed,
        "modified": $modified
    },
    "webhook": {
        "id": "1217917570955612210",
        "token": "lzUm9-mWH556vZrjgvN-34ED09nOsp9LdMQgdH_ZihoG4WCGu2xQBUaUHbPguV_ggtaQ"
    }
}
EOF
)

curl -X POST -H "Content-Type: application/json" -d "$json_body" $api_url
EOF

chmod +x .git/hooks/post-commit

echo "Post-commit hook setup complete. It will now run after every commit."
