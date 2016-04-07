#! /bin/bash

if [ $# != 1 ]
then
  echo "Usage: $0 <number of participants>"
  exit -1
fi

PREFIX="/home/tjt12/lottery-app"

for i in `seq 1 $1`;
do
  mkdir "dir-$i"
  cd dir-$i
  mkdir data
  touch bitcoin.conf
  port=$((${i}+18445))
  rpcport=$((${i}+32222))
  args="-printtoconsole -datadir=$PREFIX/dir-$i/ -regtest -daemon -printtoconsole -listen -port=$port -rpcport=$rpcport"
  com="$PREFIX/lotterycoin/src/bitcoind $args"
  echo  "$com" > run_daemon.sh
  chmod +x run_daemon.sh
  cd ../
done
