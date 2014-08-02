#!/usr/bin/env bash

wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/7u65-b17/jdk-7u65-linux-x64.tar.gz

tar -xvf jdk-7*
mkdir /usr/lib/jvm
mv ./jdk1.7* /usr/lib/jvm/jdk1.7.0
update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.7.0/bin/java" 1
update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.7.0/bin/javac" 1
update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/jdk1.7.0/bin/javaws" 1
chmod a+x /usr/bin/java
chmod a+x /usr/bin/javac
chmod a+x /usr/bin/javaws

apt-get update
#Insert code to install Java and move it to correct location here.
apt-get install -y git-core
apt-get install -y maven2

git clone https://github.com/WebGoat/WebGoat.git
chown -R vagrant:vagrant ./WebGoat 
cd WebGoat

update-alternatives --set java /usr/lib/jvm/jdk1.7.0/bin/java
update-alternatives --set javac /usr/lib/jvm/jdk1.7.0/bin/javac 
update-alternatives --set javaws /usr/lib/jvm/jdk1.7.0/bin/javaws 

mvn tomcat:run-war &

