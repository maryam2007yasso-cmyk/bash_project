#!/bin/bash
#print information
log_info() {
echo "[INFO] $1"
}


#print error
log_error() {
echo "[ERROR] $1" >&2
}

#record every action
log_action() {
local action="$1"
echo "$(date '+%Y-%m-%d %H:%M:%S') - $action" >> "LOG_FILE"
}

#check if the target exict
require_dir() {
if [[ ! -d "$TARGET_DIR" ]]; then
log_error "Directory does not exist"
return 1
fi
}


