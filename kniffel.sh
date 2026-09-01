#!/bin/sh
printf '\033c\033]0;%s\a' Kniffel_Rougelike
base_path="$(dirname "$(realpath "$0")")"
"$base_path/kniffel.x86_64" "$@"
