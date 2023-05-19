#!/usr/bin/env bash

set -e

tagName=$1;

if [[ -z "${tagName}" ]]; then
    echo "Missing tag name as argument; exiting"
    exit 1
fi

update_version () {
    local jsonFile=$1
    node > out_${jsonFile} <<EOF
    var data = require('./${jsonFile}');
    data.version = '${tagName}';
    console.log(JSON.stringify(data, null, 2));

EOF
    rm ${jsonFile}
    mv out_${jsonFile} ${jsonFile}
}

update_version package.json
cd lib/
update_version lcp_manifest.json
cd ../

git add package.json lib/lcp_manifest.json
git commit -m "update version tag to ${tagName}"

read -p "Enter tag message: " msg
git tag -s "${tagName}" -m "${msg}"
git push origin
git push origin "${tagName}"

