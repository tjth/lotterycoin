#! /bin/bash 

if [ $# != 1 ]
then
  echo "Usage: $0 <number of participants>"
  exit -1
fi


for i in `seq 1 $1`;
do
  rm -r "dir-$i"
done
