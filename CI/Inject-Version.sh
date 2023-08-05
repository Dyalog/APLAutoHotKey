#!/bin/bash
# APLAutoHotKey inject_version
raw_version=`cat APLSource/version.apla | grep "'[0-9]\+\.[0-9]\+\.0-\?\w\+\?" | grep -o "[0-9]\+\.[0-9]\+\.0-\?\w\+\?"`
major_minor=`echo ${raw_version} | grep -o "[0-9]\+\.[0-9]\+"`
special=`echo ${raw_version} | grep -o "\-\w\+$"`

last_release=`curl https://api.github.com/repos/Dyalog/APLAutoHotKey/releases?per_page=1`
last_patch=`echo $last_release | sed -r 's/.*tag_name": "v[0-9]+.[0-9]+.([0-9]+).*/\1/p' | head -1`
patch=$(($last_patch + 1))

full_version=${major_minor}.${patch}${special}
echo ${full_version}

sed -i -r "s/[0-9]+.[0-9]+.[0-9]+-?\w+?\/DEVELOPMENT/${full_version}/g" APLSource/version.apla
exit 0
