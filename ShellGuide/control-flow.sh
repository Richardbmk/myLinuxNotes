#!/bin/bash
#
# Sample script to demonstrate control flow with if-else statements
log_date() { echo "$(date): $1"; }
error_message() { echo "An error occurred!"; }

dirs_to_cleanup=(/tmp/testdir1 /tmp/testdir2)
SESSION_ID="session01"

cleanup_dirs() {
    local dir
    for dir in "${dirs_cleanup[@]}"; do
        if [[ -d ${dir}/${SESSION_ID} ]]; then
            log_date "Cleaning up old files in ${dir}/${SESSION_ID}"
            rm "${dir}/${SESSION_ID}/"* || error_message
        else
            mkdir -p "${dir}/${SESSION_ID}" || error_message
        fi
    done
}

for d in "${dirs_to_cleanup[@]}"; do
    mkdir -p "$d/$SESSION_ID"
    echo "dummy" > "$d/$SESSION_ID/file.txt"
done

cleanup_dirs