#!/bin/bash

DATA_DIR=./data_files/
MODEL_DIR=./model_files/
OUTPUT_DIR=./output/
GPU=1
VERSION=v5
DATASETS=(SymDef)
MODELS=(roberta-large)


for DATASET in "${DATASETS[@]}"
do
for MODEL in "${MODELS[@]}"
do
    BATCH=12
    MAXLEN=100

    echo "============================================"
    echo "Testing (POS,NP,VP,Entity,Acronym)..." $MODEL $K ${DATASET} ${BATCH} ${MAXLEN}
    CUDA_VISIBLE_DEVICES=$GPU \
    python -W ignore main.py \
        --model_name_or_path=$MODEL \
        --data_dir ${DATA_DIR} \
        --output_dir ${MODEL_DIR}/${VERSION}/${DATASET}/MAXLEN=${MAXLEN}/${MODEL} \
        --prediction_dir ${OUTPUT_DIR}/predictions/${VERSION}/${DATASET}/MAXLEN=${MAXLEN}/${MODEL} \
        --result_dir ${DATA_DIR}/results/${VERSION}/${DATASET}/MAXLEN=${MAXLEN}/${MODEL} \
        --task ${DATASET} --dataset ${DATASET} \
        --use_crf \
        --use_heuristic \
        --do_eval --use_pos --use_np --use_vp --use_entity --use_acronym \
        --per_device_eval_batch_size ${BATCH} \
        --max_seq_len ${MAXLEN}  \
        --overwrite_cache \
        --joint_learning
    echo "============================================"
    #exit
done
done
