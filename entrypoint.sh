#!/bin/sh
display_usage () {
	echo 'Usage: [-i <interval>] SRC DST'
	exit 2
}

interval=30
while getopts i: opt; do
	case $opt in
		i) interval="$OPTARG";;
		*) display_usage;;
	esac
done
shift $(($OPTIND - 1))
src=$1
dst=$2

[[ -n "$src" ]] && [[ -n "$dst" ]] || display_usage

log () {
	printf '%s %s\n' $(date --utc +'%Y-%m-%dZ%T') "$*"
}

mkdir -p "$src"
mkdir -p "$dst"

log "Moving from $src/ to $dst/"

while true; do
	ls "$src/" | while read file; do
		mv "$src/$file" "$dst/"
		log "moved: $file"
	done
	sleep $interval
done
