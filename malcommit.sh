#!/bin/bash

OUTFILE=
DIR="."

OPTIND=1

NCHARS=
FORCE_CMT_MSG=
while getopts "n:m:" f; do
  case ${f} in
    m) FORCE_CMT_MSG=$OP