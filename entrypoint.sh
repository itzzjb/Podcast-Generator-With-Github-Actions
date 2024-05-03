# This will be called from the container which is running the docker image
# Used to write scripts to command-line

#!/bin/bash

echo "========================="

git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"
git config --global --add safe.directory /github/workspace

# python3 /usr/bin/feed.py
/venv/bin/python /usr/bin/feed.py

git add -A && git commit -m "update feed"
git push --set-upstream origin main

echo "========================="

# We need to give permission to entrypoint.sh
# Run in terminal
# chmod -R 775 entrypoint.sh




