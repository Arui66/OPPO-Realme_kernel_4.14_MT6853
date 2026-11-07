#!/bin/sh
# SPDX-License-Identifier: GPL-2.0

# Do NOT pipe compiler output into `grep -q`: grep exits on first match and
# closes the pipe, and clang treats the resulting EPIPE as a fatal
# "LLVM ERROR: IO failure on output stream: Broken pipe". Capture the whole
# output first, then grep the variable.

out=$($* -dM -E - </dev/null 2>&1)
case "$out" in
*__ANDROID__*) echo "y" ;;
esac
