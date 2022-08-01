#!/bin/bash -xe

# download bootstrap-downloader
wget https://mirror.veriblock.org/bootstrap-downloader-0.4.9-dev.20.zip

# unzip bootstrap-downloader
unzip bootstrap-downloader-0.4.9-dev.20.zip

# download blocks
./bootstrap-downloader-0.4.9-dev.20+develop.bd3f2c0/bin/bootstrap-downloader -d ./data/
