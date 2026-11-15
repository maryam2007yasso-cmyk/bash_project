x#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="${1:-.}"
ACTION="$2"
BACKUP_DIR="$SCRIPT_DIR/backups"
LOG_FILE="$SCRIPT_DIR/auditor.log"

source "$SCRIPT_DIR/lib.sh"

#check the target dir exists

if ! require_dir "$TARGET_DIR"; then
exit 1
fi

AUDIT_DIR="$(cd -- "$TARGET_DIR" && pwd)"

#display main menu

show_menu() {
echo "=="
echo "FILE AUDITOR"
echo "=="
echo "1. scan directory"
echo "2. permission audit"
echo "3. extension report"
echo "4. search file"
echo "5. backup all files"
echo "6. list backups"
echo "7. restore backup"
echo "exit"
echo "=="

}

#run the menu

main_menu() {

local choice

while true; do
show_menu
read -r -p "enter your choice" choice

case "$choice" in
1) scan_directory ;;
2) permission_audit ;;
3) extension_report ;;
4) search_file ;;
5) backup_all ;;
6) list_backups ;;
7) restore_backup ;;
8) echo "exiting program .."; break ;;
*) log_error "invalid choice , please try again." ;;
esac
done
}

#execute action 

if [[ -n "$ACTION" ]]; then
case "$ACTION" in
scan) scan_directory ;;
perms) permission_audit ;;
ext) extension_report ;;
backup) backup_all ;;
*) log_error "invalid action"; exit 1 ;;
esac
else
main_menu
fi
