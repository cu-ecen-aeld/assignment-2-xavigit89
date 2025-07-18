#!/bin/bash

if [ $# -lt 1 ]
then
   echo "Must provide a path to the file to be written"
   exit 1
fi

if [ $# -lt 2 ]
then
   echo "Must provide a string to write to the given file"
   exit 1
fi

writefile=$1
writestr=$2

if [ ! -e ${writefile} ]
then
   mkdir -p $(dirname ${writefile}) && touch ${writefile}
   if [ ! $? ]
   then
	   echo "Unable to create file"
	   exit 1
   fi
fi

echo "${writestr}" > ${writefile}

