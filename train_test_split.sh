#!/usr/bin/env bash
# bash train_test_split input.txt 90
# PERCENT：integer
INPUT_PATH=$1
PERCENT=$2
N_TOTAL=`cat $INPUT_PATH | wc -l`
N_TRAIN=$[$N_TOTAL * $PERCENT / 100]
N_VAL=$[$N_TOTAL - $N_TRAIN]
echo "N_TRAIN: ${N_TRAIN}"
echo "N_VAL: ${N_VAL}"
cat $INPUT_PATH | head -$N_TRAIN > "${INPUT_PATH}_train"
cat $INPUT_PATH | tail -$N_VAL > "${INPUT_PATH}_val"
