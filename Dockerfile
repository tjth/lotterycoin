FROM ubuntu:precise

RUN apt-get -y update
RUN apt-get install -y python-software-properties 


# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
RUN export JAVA_HOME=/usr/lib/jvm/java-8-oracle

# Define default command.
CMD ["bash"]

COPY app.jar /
COPY bitcoin.conf /
RUN mkdir /.bitcoin-appdir
RUN echo "java -jar app.jar" >> /runapp.sh
RUN chmod +x /runapp.sh

RUN mkdir /lotterycoin
COPY lotterycoin/src /lotterycoin

RUN mkdir ~/.bitcoin
RUN echo "rpcuser=test\nrpcpassword=test\n" > ~/.bitcoin/bitcoin.conf

RUN echo "alias rt='bitcoin-cli -regtest'" >> ~/.bashrc
RUN echo "alias bitcoinregtest='bitcoind -regtest -printtoconsole -daemon -conf=/bitcoin.conf'" >> ~/.bashrc
