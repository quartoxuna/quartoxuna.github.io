#!/bin/bash
#
# Creates a new tag page
#

TAG_DIR=./tag/

if [ $# -eq 0 ]; then
    echo "No tag specified!" >&2
    exit 1
fi

TAG_NAME="${1}"
FILEPATH="${TAG_DIR}/${TAG_NAME}.md"

echo "Creating new tag '${TAG_NAME}'..."

cat << EOF > ${FILEPATH}
---
layout: tag
tag: ${TAG_NAME}
permalink: /tag/${TAG_NAME}
---
EOF
