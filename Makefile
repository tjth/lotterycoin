DOCKER_RUN=sudo docker run -t
DOCKER_ALICE   =$(DOCKER_RUN) -p 19444:18444 -p 19332:18332 --name=alice --hostname=alice
DOCKER_BOB     =$(DOCKER_RUN) -p 20444:18444 -p 20332:18332 --name=bob --hostname=bob
DOCKER_CHARLIE =$(DOCKER_RUN) -p 21444:18444 -p 21332:18332 --name=charlie --hostname=charlie
DOCKER_DAVE    =$(DOCKER_RUN) -p 22444:18444 -p 22332:18332 --name=dave --hostname=dave
DOCKER_EVE     =$(DOCKER_RUN) -p 23444:18444 -p 23332:18332 --name=eve --hostname=eve
DOCKER_MIKE    =$(DOCKER_RUN) -p 24444:18444 -p 24332:18332 --name=mike --hostname=mike

RUN_DAEMON=bitcoind -regtest -rpcallowip=::/0 -printtoconsole -server
RUN_SHELL=bash

build:
	sudo docker build dockerfile/java" .

alice_rm:
	-sudo docker rm -f alice

bob_rm:
	-sudo docker rm -f bob

charlie_rm:
	-sudo docker rm -f charlie

dave_rm:
	-sudo docker rm -f dave

eve_rm:
	-sudo docker rm -f eve

mike_rm:
	-sudo docker rm -f mike

alice_daemon: alice_rm build
	$(DOCKER_ALICE) -d=true $(RUN_DAEMON)

alice_shell: alice_rm build
	$(DOCKER_ALICE) -i lotteryapp

bob_daemon: bob_rm build
	$(DOCKER_BOB) -d=true $(RUN_DAEMON)

bob_shell: bob_rm build
	$(DOCKER_BOB) -i lotteryapp

charlie_daemon: charlie_rm build
	$(DOCKER_CHARLIE) -d=true $(RUN_DAEMON)

charlie_shell: charlie_rm build
	$(DOCKER_CHARLIE) -i lotteryapp

dave_daemon: dave_rm build
	$(DOCKER_DAVE) -d=true $(RUN_DAEMON)

dave_shell: dave_rm build
	$(DOCKER_DAVE) -i lotteryapp

eve_daemon: eve_rm build
	$(DOCKER_EVE) -d=true $(RUN_DAEMON)

eve_shell: eve_rm build
	$(DOCKER_EVE) -i lotteryapp
        
mike_daemon: mike_rm build
	$(DOCKER_MIKE) -d=true $(RUN_DAEMON)

mike_shell: mike_rm build
	$(DOCKER_MIKE) -i lotteryapp
