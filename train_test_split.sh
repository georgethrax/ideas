#!/usr/bin/env bash
# PERCENTﻩnteger
INPUT_PATH=$1
PERCENT=$2
N_TOTAL=`cat $INPUT_PATH | wc -l`
N_TRAIN=$[$N_TOTAL * $PERCENT / 100]
N_VAL=$[$N_TOTAL - $N_TRAIN]
echo "N_TRAIN: ${N_TRAIN}"
echo "N_VAL: ${N_VAL}"

SHUF_PATH="${INPUT_PATH}.shuf"
TRAIN_PATH="${INPUT_PATH}.train"
VAL_PATH="${INPUT_PATH}.val"

shuf $INPUT_PATH -o $SHUF_PATH
cat $SHUF_PATH | head -$N_TRAIN > $TRAIN_PATH
cat $SHUF_PATH | tail -$N_VAL > $VAL_PATH
