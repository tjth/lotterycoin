#TODO: generate blocks, send the addresses money for each participant

cd seed_nodes/seed-daemon-1

PARTICIPANTSLOC=/home/tjt12/lotteryapp/participants

count=0
for D in $PARTICIPANTSLOC/*; do
  if [ -d "${D}" ]; then
    count=$count+1
  fi
done

coinsNeeded=$((${count}*5))
blocksNeeded=$((${coinsNeeded} % 50))
./bitcoin_command.sh generate $((${blocksNeeded} + 101))


for D in $PARTICIPANTSLOC/*; do
  if [ -d "${D}" ]; then
    ./bitcoin_command.sh sendtoaddress `cat ${D}/address.txt` 5
  fi
done

sleep 1
./bitcoin_command.sh generate 1
cd -
