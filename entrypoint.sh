# This will be called from the container which is running the docker image
# Used to write scripts to command-line

#!/bin/bash
echo "==========================="

# Getting the name and email of the user 
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${INPUT_EMAIL}"

# Adding to the safelist of directories
git config --global --add safe.derectory /github/workspace

python3 /usr/bin/feed.py

git add .
git commit -m "Update feed"
git push --set-upstream origin main

echo "==========================="

# We need to give permission to entrypoint.sh
# Run in terminal
# chmod -R 775 entrypoint.sh




