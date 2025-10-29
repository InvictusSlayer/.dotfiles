#!/usr/bin/bash

snore() {
    local IFS
    [[ -n "${_snore_fd:-}" ]] || exec {_snore_fd}<> <(:)
    read -r ${1:+-t "$1"} -u $_snore_fd || :
}

while snore 0.1; do
    brightness=$(<~/.config/hypr/scripts/brightness)
    echo "{\"percentage\": $brightness}"
done

exit 0
