#!/bin/bash

if [ $# -lt 1 ]
then
   echo "A path to a directory must be provided"
   exit 1
fi

if [ $# -lt 2 ]
then
   echo "A search key must be provided"
   exit 1
fi

filesdir=$1
searchstr=$2

if [ ! -d "${filesdir}" ]
then
  echo "${filesdir} is not a directory"
  exit 1
fi

X=$(find ${filesdir} -type f | wc -l)
Y=$(grep ${searchstr} -r ${filesdir} | wc -l)
echo "The number of files are $X and the number of matching lines are $Y"

