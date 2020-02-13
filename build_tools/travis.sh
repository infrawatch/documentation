#!/bin/bash
# original source: https://www.alkaline-ml.com/2018-12-23-automate-gh-builds/

# Fail out on an error
set -e

# install deps for Fedora
echo "--- installing dependencies"
dnf install findutils git make ruby rubygems -y
gem install --no-document --minimal-deps asciidoctor

# get the current working branch, if we're master, we'll end up pushing new docs
echo "--- current working branch is $BRANCH"

echo "--- building documentation"
make clean html

# Checkout our gh-pages branch, remove everything but .git
echo "--- switching to gh-pages"
git fetch --all
git checkout gh-pages
git pull origin gh-pages

# Make sure to set the credentials! You'll need these environment vars
# set in the "Environment Variables" section in Circle CI
echo "--- setting up git configuration"
git config --global user.email "$GH_EMAIL" > /dev/null 2>&1
git config --global user.name "$GH_NAME" > /dev/null 2>&1

# Remove all files that are not in the .git dir
echo "--- removing all files"
find . -maxdepth 1 -not -wholename ".git/*" -type f -delete
rm -rf images/

# We need this empty file for git not to try to build a jekyll project.
# If your project *is* Jekyll, then this doesn't apply to you...
echo "--- moving built files into the top-level directory"
touch .nojekyll
mv build/doc-Service-Telemetry-Framework/* ./
mv index-upstream.html index.html
rm -rf build/

# Add everything, get ready for commit. But only do it if we're on
# master. If you want to deploy on different branches, you can change
# this.
if [[ "$BRANCH" =~ ^master$|^[0-9]+\.[0-9]+\.X$ ]]; then
    echo "Branch is master, so pushing docs to gh-pages"
    git add --all
    git commit -am '[ci skip] publishing updated documentation...'

    git remote rm origin
    git remote add origin https://$GH_NAME:$GH_TOKEN@github.com/infrawatch/documentation.git

    git push origin gh-pages
else
    echo "Not on master, so won't push doc"
fi
