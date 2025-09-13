#!/bin/bash
#
# Creates a new draft post skeleton
#

DRAFT_DIR=./_drafts
DATE_FMT="+%Y-%m-%d"

if [ $# -eq 0 ]; then
    echo "No title specified!" >&2
    exit 1
fi

TITLE="${1}"
FILENAME="$(date $DATE_FMT)-${TITLE}.md"
FILEPATH="${DRAFT_DIR}/${FILENAME}"

echo "Creating new post skeleton '${FILEPATH}'..."

cat << EOF > ${FILEPATH}
---
layout: post
title: ${TITLE}
---

Hack the planet
EOF
