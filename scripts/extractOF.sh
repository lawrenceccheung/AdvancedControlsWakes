#!/bin/sh
#
# Extract specific variables from OpenFAST output file
#

DATADIR=./
PREFIX=OpenFAST

# Parse the arguments and options
# --------------------------
# For arg parsing details/example, see https://medium.com/@Drew_Stokes/bash-argument-parsing-54f3b81a6a8f
PARAMS=""
while (( "$#" )); do
    case "$1" in
	-d|--datadir)
	    DATADIR=$2
	    shift 2
	    ;;
	-p|--prefix)
	    PREFIX=$2
	    shift 2
	    ;;	
	-h|--help)
	    echo "extractOF.sh OUTFILE VAR1 VAR2"
	    exit
	    ;;
	--) # end argument parsing
	    shift
	    break
	    ;;
	-*|--*=) # unsupported flags
	echo "Error: Unsupported flag $1" >&2
	exit 1
	;;
	*) # preserve positional arguments
	    PARAMS="$PARAMS $1"
	    shift
	    ;;
    esac
done # set positional arguments in their proper place
eval set -- "$PARAMS"

# Check the number of arguments
if [ $# -lt 2 ]; then
    echo "Please provide both the OUTFILE and at least one variable"
    return 1
fi

# Location of the OPENFAST output file
OUTFILE=$1
shift

grepOFcols() {
    OFfile=$1
    col1=$2
    col2=$3
    headers=`head -n7 $OFfile |tail -n1 |fmt -1 |nl`
    col1num=`echo "$headers" |grep "$col1" |awk '{print $1}'`
    col2num=`echo "$headers" |grep "$col2" |head -n1 |awk '{print $1}'`

    tail -n +7 $OFfile | awk -v col1num=$col1num -v col2num=$col2num '{print $col1num, $col2num}'
}

# Create the directory for output
mkdir -p $DATADIR

echo $OUTFILE
for var in $@; do
    echo $var
    grepOFcols $OUTFILE Time ${var} > $DATADIR/${PREFIX}_${var}.dat
done

