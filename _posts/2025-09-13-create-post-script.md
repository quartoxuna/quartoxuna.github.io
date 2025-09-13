---
layout: post
title: Bash script for fast post creation
author: quartoxuna
tags: bash
---

With this post I want to create a simple bash script, that creates a ready-to-go skeleton file for new blog posts.
The posts should be created in the `_drafts` folder first.

As an argument, I simply want to specify the title of the new blog post.

[_newPost.sh_](https://github.com/quartoxuna/quartoxuna.github.io/blob/main/newPost.sh)
```bash
#!/bin/bash
#
# Creates a new draft blog post skeleton
#

TARGET_DIR="_drafts/"
DATE_FMT="+%Y-%m-%d"

# Check for arguments
if [ $# -eq 0 ]; then
    echo "No title specified!" >&2
    exit 1
fi

TITLE="${1}"
FILENAME="$(date $DATE_FMT)-${TITLE}.md"
FILEPATH="${TARGET_DIR}/${FILENAME}"

echo "Creating new post skeleton '${FILEPATH}'..."
cat << EOF > ${FILEPATH}
---
layout: post
title: ${TITLE}
---

Ready to go...
EOF
```

With this script I am able to fire out new draft blog posts, whenever I like.

