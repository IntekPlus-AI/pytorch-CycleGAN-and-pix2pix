# FROM nvidia/cuda:10.1-base
FROM nvidia/cuda:11.4.0-base

RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/3bf863cc.pub

RUN apt update && apt install -y wget unzip curl bzip2 git
RUN curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b
RUN rm Miniconda3-latest-Linux-x86_64.sh
ENV PATH=/miniconda/bin:${PATH}
RUN conda update -y conda

RUN conda install -y pytorch torchvision -c pytorch

RUN rm -rf /workspace/*
WORKDIR /worspace/cyclegan

ADD requirements.txt .
RUN pip install -r requirements.txt

WORKDIR /workspace
