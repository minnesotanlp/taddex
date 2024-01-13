#!/bin/bash

DATASET=SymDef

DATA_DIR=./data_files/
MODEL_DIR=./model_files/
GPU=0
VERSION=v5
MODEL=roberta-large

BATCH=12 #8 #32
MAXLEN=100
echo "============================================"
echo "Training ..." $MODEL ${VERSION} ${DATASET} ${BATCH} ${MAXLEN}
CUDA_VISIBLE_DEVICES=$GPU \
python -W ignore main.py \
    --model_name_or_path=$MODEL \
    --data_dir ${DATA_DIR} \
    --output_dir ${MODEL_DIR}/${VERSION}/${DATASET}/MAXLEN=${MAXLEN}/${MODEL} \
    --task ${DATASET} --dataset ${DATASET}  \
    --use_heuristic \
    --use_crf \
    --do_train --use_pos --use_np --use_vp --use_entity --use_acronym \
    --per_device_train_batch_size ${BATCH} --per_device_eval_batch_size ${BATCH} \
    --max_seq_len ${MAXLEN} --learning_rate 2e-5 \
    --num_train_epochs 50 --logging_steps 500 --save_steps 500 \
    --overwrite_cache --overwrite_output_dir \
    --joint_learning
echo "============================================"
