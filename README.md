#!/bin/bash
# curl -fsSL https://airdb.run/install.sh | bash - 

set -u

abort() {
  printf "%s\n" "$@"
  exit 1
}

main() {
	echo curl -fsSL https://github.com/airdb/adb/releases/download/v1.0.12/adb -O /tmp/adb
}

## here we go
main
echo "see you!"
