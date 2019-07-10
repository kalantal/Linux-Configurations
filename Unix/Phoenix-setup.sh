#!/bin/bash

cat bashrc | sudo tee -a /etc/profile

git config --global user.name "Justin Restivo"
git config --global user.email justin.restivo@citi.com
git config --global push.default matching
