#!/bin/sh

scriptFolder=$(dirname $(readlink -f $0))
websiteFolder='./output'
sourceFile=''

getHelp() {
	cat <<HELP
Commands related to this script
USAGE:
	main.sh addImg [FLAGS] <srcFile>
srcFile designating a file.

FLAGS:
	-h			Print help informations.
	--help		Print help informations.

	-s <directory> 		 Sepcify the site folder.
	--site=<directory> Sepcify the site folder.
HELP

	return 1
}

main() {
	while getopts ':hs:-:' option; do
		case $option in
			-)
				case ${OPTARG} in
					help)
						getHelp
						exit 0
						;;

					site=*)
						websiteFolder=${OPTARG#*=}
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
			
			s)
				websiteFolder=${OPTARG}
				;;

			\?)
				echo "Invalid option -$option \n" >&2
				getHelp >&2
				exit 1
				;;
		esac
	done
	shift $((OPTIND-1))

    cd $websiteFolder
    sourceFile=$1
	cp ${sourceFile} ./static/img/
	exit 0
}

main ${@}
