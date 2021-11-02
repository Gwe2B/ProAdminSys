#!/bin/sh

scriptFolder="$(dirname $0)"
outputFolder="output/"

getHelp() {
	cat <<HELP
Commands related to this script
USAGE:
	$(basename $0) [FLAGS] [SUBCOMMAND]
FLAGS:
	-h		Print help informations.
	-o		With build, sepcify the output folder. Otherwise it will be ignored.
SUBCOMMANDS:
	build		Build the website
	install		Install the environment
HELP

	return 1
}

main() {
	while getopts ':ho:' option; do
		case $option in
			h)
				getHelp
				;;
			
			o)
				outputFolder=${OPTARG}
				;;

			\?)
				echo "Invalid option -$option \n" >&2
				getHelp >&2
				exit 1
				;;
		esac
	done
	shift $((OPTIND-1))

	# Remove main command from the args list
	subcommand="${1:-}"
	if [ -z ${subcommand} ]; then
		echo "Please enter a subcommand!"
		getHelp
		return 0
	fi

	shift
	case "${subcommand}" in
		install)
			${scriptFolder}/install.sh
			exit 0
			;;

		build)
			${scriptFolder}/build.sh
			exit 0
			;;

		*)
			echo "Invalid subcommand: ${subcommand}!"
			getHelp
			;;
	esac
}

main ${@}
