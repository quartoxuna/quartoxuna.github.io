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
title: ${TITLE}
author: quartoxuna
layout: post
date `date +%Y-%m-%d`
tags: []
categories: []
---

Hack the planet
EOF
