#!/bin/sh

scriptFolder=$(dirname $(readlink -f $0))
authFileContent=''
outputFolder='./output'
sourceImgFolder=''

getHelp() {
	cat <<HELP
Commands related to this script
USAGE:
	$(basename $0) build [FLAGS] <srcDirectory>
srcDirectory designating the folder containing the images to build the website.

FLAGS:
	-h			Print help informations.
	--help		Print help informations.

	-o <directory> 		 Sepcify the output folder.
	--output=<directory> Sepcify the output folder.
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

					output=*)
						outputFolder=${OPTARG#*=}
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

    sourceImgFolder=$1

	mkdir $outputFolder
    cd $outputFolder

    echo "=== Bottle Dowload & Installation  ==="
    echo "=> Creation of an virtual environment & connect to it"


    ~/.local/share/Python-3.10/bin/python3 -m venv venv
    . venv/bin/activate 
    pip install -U bottle

    cp -r ${scriptFolder}/site/* .

    mkdir ./static/img
    cp ${sourceImgFolder}/* ./static/img/

    echo "Lancement du serveur sur localhost:8080"
    python main.py

    echo "=> Disconnection of the virtual environment"
    deactivate
}

main ${@}
