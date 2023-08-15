#!/bin/bash
# APLAutoHotKey inject_version
raw_version=`cat APLSource/version.apla | grep "'[0-9]\+\.[0-9]\+\.0-\?\w\+\?" | grep -o "[0-9]\+\.[0-9]\+\.0-\?\w\+\?"`
major_minor=`echo ${raw_version} | grep -o "[0-9]\+\.[0-9]\+"`
special=`echo ${raw_version} | grep -o "\-\w\+$"`

# We have checked out some specific tag (a release we need to build) or the HEAD of the trunk (about to publish a new release)
# Get the last tag before this commit (HEAD^). Our patch number (this tagged release or the new release we are about to publish) is previous_patch+1
previous_release=`git describe --tags --abbrev=0 HEAD^`
previous_patch=`echo $last_release | sed -r 's/v[0-9]+.[0-9]+.([0-9]+).*/\1/p' | head -1`
patch=$(($previous_patch + 1))

full_version=${major_minor}.${patch}${special}
echo ${full_version}

sed -i -r "s/[0-9]+.[0-9]+.[0-9]+-?\w+?\/DEVELOPMENT/${full_version}/g" APLSource/version.apla
exit 0
