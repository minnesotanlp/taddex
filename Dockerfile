# Filename: Dockerfile

FROM nvidia/cuda:11.6.2-cudnn8-devel-ubuntu20.04
ENV PYTHON_VERSION 3.9.12
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt-get install -y python3-pip python3-dev nano git wget unzip python3-opencv \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip
RUN pip3 install --upgrade numpy
RUN pip3 install torch --index-url https://download.pytorch.org/whl/cu116
RUN apt-get install -y rustc 
RUN mkdir -p /usr/local/src/taddex
WORKDIR  /usr/local/src/taddex

RUN pip install --upgrade pip setuptools wheel
#RUN pip install --upgrade 'spacy[cuda116]'
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
#RUN python -m spacy download en_core_web_sm
# Copy over the source code
COPY . /usr/local/src/taddex
RUN python setup.py install
