#!/bin/bash

if [ ! -f s3-tests-master.zip ]; then
	echo "no s3-tests-master.zip"
	exit 0
fi

unzip s3-tests-master.zip

mv s3-tests-master s3-tests

cp s3.conf s3-tests
cp Citi_DEVELOPMENT_chain.pem certificates
chmod +x s3-tests/bootstrap

cd s3-tests
echo "Setup Complete -- Working Directory:"
pwd
exec bash

exit 0
