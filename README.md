# TaDDEx

This repository includes code and dataset for Martin-Boyle et al's paper "Complex Mathematical Symbol Definition Structures: A Dataset and Model for Coordination Resolution in Definition Extraction"

## Setup
A Dockerfile is provided for ease of use, but may need to be updated depending on the version of CUDA running on your system.

## Training 
To train TaDDEx, ensure that `train.json`, `test.json`, and `dev.json` are located in `data_files/SymDef/`, then run the script `./train_test_scripts/run_train.sh`. Training should take between 3 and 5 hours. At completion, the model will be stored in a directory called `model_files`.

## Testing
To train TaDDEx, ensure that `train.json`, `test.json`, and `dev.json` are located in `data_files/SymDef/` and that the trained TaDDEx model is located in `model_files/`. Then run the script `./train_test_scripts/run_test.sh`. At completion, the scores will be printed to the terminal and the inferences will be stored in a `test.json` file located in `outputs/`.

## Coming Soon
A script to transform your dataset into SymDef format.
