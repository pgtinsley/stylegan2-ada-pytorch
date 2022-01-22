#!/bin/bash
#$ -q gpu@@cvrl_gpu
#$ -l gpu_card=1
#$ -N sg2-ada

cd /scratch365/ptinsley/Research/stylegan2-ada-pytorch/

module load cuda/11.0
nvcc --version

export PATH=/usr/local/cuda-11.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-11.0/lib64:$LD_LIBRARY_PATH

# module load conda
source ~/anaconda3/bin/activate sg2-ada-pytorch

python generate.py --outdir=./test --trunc=0.5 --seeds=85-95 \
    --network=https://nvlabs-fi-cdn.nvidia.com/stylegan2-ada-pytorch/pretrained/ffhq.pkl
