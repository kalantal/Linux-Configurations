#!/bin/bash
#set -x

shopt -s expand_aliases

export pumba_test=/usr/local/bin/pumba/automation/pumba_linux_386
sudo mkdir -p /usr/local/bin/pumba
sudo cp ./pumba_linux_386 /usr/local/bin/pumba

sudo groupadd docker
sudo gpasswd -a $USER docker

echo -en "\\n$(date)\\nID's of built containers\\n" >>./log

sudo docker run --name test_1 -t -d ubuntu >>./log
sudo docker run --name test_2 -t -d ubuntu >>./log
sudo docker run --name test_3 -t -d ubuntu >>./log
sudo docker run --name test_4 -t -d ubuntu >>./log

echo -en "\\nContainer status after build\\n" >>./log
sudo docker ps -a >>./log

echo -en "\\nTeardown:\\n" >>./log
sudo /usr/local/bin/pumba/pumba_linux_386 kill test_1 &>>./log
sudo /usr/local/bin/pumba/pumba_linux_386 kill test_2 &>>./log
sudo /usr/local/bin/pumba/pumba_linux_386 kill test_3 &>>./log
sudo /usr/local/bin/pumba/pumba_linux_386 kill test_4 &>>./log

echo -en "\\nContainer status after teardown\\n" >>./log
sudo docker ps -a  >>./log

echo -en "\\nContainers removed from ps\\n" >>./log
sudo docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo docker rm >>./log

cat log

docker_cleanup() {
#Removes exited containers
sudo docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs sudo docker rm

#Removes created containers
sudo docker ps -a | grep Create | cut -d ' ' -f 1 | xargs sudo docker rm

#docker ps -aq -f status=exited

#Remove all stopped containers
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
}

docker_results() {
#Remove top line "HERE!!!"
sed -i '1d' ./results/pumba_results.log
#Remove empty commands
sed -i -e "/Kill containers/d" ./results/pumba_results.log

if grep -q "Killing" ./results/pumba_results.log; 
	then
		echo -en "Test injected sucessfully\\n"
	else
		echo -en "Test injection failed\\n"
fi
}
docker_results

docker_status() {
sudo docker ps -a
}

while [ $# -gt 0 ]; do
	case "$1" in
	case_1)
			$pumba_test "$case_1"
			;;
	case_2)
			$pumba_test "$case_2"
			;;
	case_3)
			$pumba_test "$case_3"
			;;
	case_4)
			$pumba_test "$case_4"
			;;
	esac
	shift
done
