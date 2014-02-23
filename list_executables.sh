#!/bin/sh

find . -name .git -prune -or -type f -perm +111 -exec sh -c 'test "$(head -c 2 "$1")" != "#!"' sh {} \; -print | \
    grep -v -e "^\./\.git$" | \
    sed -e "s/\.\///"
