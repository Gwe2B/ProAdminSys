#!/bin/sh

helpMsg="$(basename "$0") [OPTIONS] build <ressources folder>
Programme to create a website from images in the 'ressources folder'

where OPTIONS can be:
	-h	Show this help message\n"

while getopts ':h:' option; do
	case $option in
		h)
			echo "$helpMsg"
			exit
			;;
		/?)
			echo "Unknown option -$option \n" >&2
			echo "$helpMsg" >&2
			exit 1
			;;
	esac
done
shift $((OPTIND-1))
