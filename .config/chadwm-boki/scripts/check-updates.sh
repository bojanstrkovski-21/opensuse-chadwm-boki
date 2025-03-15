#!/bin/bash

# Script to check for openSUSE Tumbleweed updates, count them, and optionally run zypper dup.

# Define variables
LOG_FILE="/var/log/tumbleweed_updates.log"
LAST_UPDATE_COUNT_FILE="$HOME/.last_update_count"
YAST_LOG="/var/log/YaST2/y2log"
AUTO_UPDATE="false" # Set to "true" to automatically run zypper dup

# Function to check for updates and return the count
check_updates() {
  sudo zypper refresh > /dev/null 2>&1
  UPDATE_COUNT=$(sudo zypper list-updates | grep -v '^S' | grep -v '^i+' | wc -l)
  echo "$UPDATE_COUNT"
}

# Function to log the update check
log_update_check() {
  local count="$1"
  echo "$(date '+%Y-%m-%d %H:%M:%S') - Updates: $count" >> "$LOG_FILE"
}

# Function to compare the current update count with the last known count.
compare_update_count() {
  local current_count="$1"

  if [ -f "$LAST_UPDATE_COUNT_FILE" ]; then
    local last_count=$(cat "$LAST_UPDATE_COUNT_FILE")

    if [ "$current_count" -gt "$last_count" ]; then
      echo "Updates available! Previous count: $last_count, Current count: $current_count"
      if [ "$AUTO_UPDATE" = "true" ]; then
        echo "Running sudo zypper dup..."
        sudo zypper dup -y # -y automatically accepts the update
        echo "sudo zypper dup completed."
      fi
    elif [ "$current_count" -lt "$last_count" ]; then
      echo "Update count decreased. Possibly due to package removal or downgrade. Previous count: $last_count, Current count: $current_count"
    else
      echo "No new updates since last check. Current count: $current_count"
    fi
  else
    echo "First update check. Current count: $current_count"
  fi

  echo "$current_count" > "$LAST_UPDATE_COUNT_FILE"
}

# Main script logic
UPDATE_COUNT=$(check_updates)
log_update_check "$UPDATE_COUNT"
compare_update_count "$UPDATE_COUNT"

# Example of how to see more detailed logs.
# grep "updates" "$YAST_LOG" | tail -n 20

exit 0