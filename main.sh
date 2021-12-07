#!/bin/sh

scriptFolder=$(dirname $(readlink -f $0))

getHelp() {
	cat <<HELP
Commands related to this script
USAGE:
	$(basename $0) SUBCOMMAND
	$(basename $0) -h | --help
FLAGS:
	-h		Print help informations.
	--help		Print help informations.
SUBCOMMANDS:
	build		Build the website
	install		Install the environment
BUILD SUBCOMMAND HELP:
	-o <directory>		Sepcify the output folder.
	--output=<directory>	Sepcify the output folder.
HELP

	return 1
}

main() {
	while getopts ':ho:-:' option; do
		case $option in
			-)
				case ${OPTARG} in
					help)
						getHelp
						exit 0
						;;

					*)
						echo "Invalid option --${OPTARG}\n">&2
						getHelp>&2
						exit 1
						;;

				esac;;
			h)
				getHelp
				exit 0
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
			${scriptFolder}/build.sh ${@}
			exit 0
			;;

		*)
			echo "Invalid subcommand: ${subcommand}!"
			getHelp
			;;
	esac
}

main ${@}
