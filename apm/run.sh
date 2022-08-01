#!/bin/bash -xe

cd $(dirname $0)

docker run -it --rm \
  --net host \
  --mount src=$PWD/apm-config,target=/data,type=bind \
  veriblock/altchain-pop-miner:0.4.13-rc.13.dev.5
