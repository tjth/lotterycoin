#! /bin/bash

if [ $# != 1 ]
then
  echo "Usage: $0 <number of participants>"
  exit -1
fi

for i in `seq 1 $1`;
do 
  ./lotterycoin/src/bitcoind -conf dir-$i/bitcoin.conf
done
