#!/bin/bash

OUTFILE=
DIR="."

OPTIND=1

NCHARS=
FORCE_CMT_MSG=
while getopts "n:m:" f; do
  case ${f} in
    m) FORCE_CMT_MSG=$OPTARG;;
    n) NCHARS=$OPTARG;;
    h) echo "./malcommit.sh [-n nchars (per commit)] [-m forced_commit_message] input_file output_file_or_directory"
  esac
done

shift $((OPTIND - 1))

IN=$1
DEST=$2

if [ ! -e "$IN" ]; then
    echo "'$IN': No such file or directory"
fi

if [ -d "$DEST" ]; then
    OUTFILE="$DEST/$(basename $IN)"
    DIR="$DEST"
else
    DIR="$(dirname $DEST)"
    mkdir -p "$DIR"
    OUTFILE="$DEST"
fi

if [ -e "$OUTFILE" ]; then
    echo "File $OUTFILE already exists"
    exit 1