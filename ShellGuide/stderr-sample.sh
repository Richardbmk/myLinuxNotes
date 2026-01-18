#!/bin/bash
#
# Sample script to demonstrate stderr logging with timestamps

err() {
    echo "[$(date '+%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
}

echo "Trying to list a non-existent file..."
if ! ls /non_existent_file; then
    err "Unable to list /non_existent_file"
    exit 1
fi

echo "Completed"