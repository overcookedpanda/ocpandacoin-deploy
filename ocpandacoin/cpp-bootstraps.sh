#!/bin/bash -e

NETWORK=mainnet
N_BTC_BLOCKS=2016
N_VBK_BLOCKS=2016
URL="http://95.217.67.120/alt-integration/api/v1.0/bootstraps?btc=${N_BTC_BLOCKS}&vbk=${N_VBK_BLOCKS}&network=${NETWORK}"
RESPONSE=$(curl -s $URL)

btc=$(echo $RESPONSE | jq -r '.bootstraps[0].BTC[0].headers')
btc_height=$(echo $RESPONSE | jq -r '.bootstraps[0].BTC[0].first_height')
vbk=$(echo $RESPONSE | jq -r '.bootstraps[0].VBK[0].headers')
vbk_height=$(echo $RESPONSE | jq -r '.bootstraps[0].VBK[0].first_height')


IFS=',' read -ra BTC <<< "$btc"
IFS=',' read -ra VBK <<< "$vbk"

echo "
// Copyright (c) 2019-2021 Xenios SEZC
// https://www.veriblock.org
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#include "bootstraps.h"

const int mainnetVBKstartHeight=$vbk_height;
const int mainnetBTCstartHeight=$btc_height;

const std::vector<std::string> mainnetBTCblocks = {
"

for i in "${BTC[@]}"; do
    echo "\"$i\","
done

echo "};
"

echo "
const std::vector<std::string> mainnetVBKblocks = {
"

for i in "${VBK[@]}"; do
	echo "\"$i\","
done

echo "};
"
