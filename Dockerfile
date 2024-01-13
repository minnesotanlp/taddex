# Filename: Dockerfile

FROM nvidia/cuda:11.6.2-cudnn8-devel-ubuntu20.04 #change based on your CUDA version
ENV PYTHON_VERSION 3.9.12
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y \
  && apt-get install -y python3-pip python3-dev nano git wget unzip python3-opencv \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip
RUN pip3 install --upgrade numpy
RUN pip3 install torch --index-url https://download.pytorch.org/whl/cu116 #change based on your CUDA version
RUN apt-get install -y rustc 
RUN mkdir -p /usr/local/src/taddex
WORKDIR  /usr/local/src/taddex

RUN pip install --upgrade pip setuptools wheel

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . /usr/local/src/taddex
RUN python setup.py install
