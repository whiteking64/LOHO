FROM nvidia/cuda:11.3.1-devel-ubuntu20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
ENV PYTHONUNBUFFERED=TRUE
ENV PYTHONDONTWRITEBYTECODE=TRUE

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    git \
    zlib1g-dev \
    libncurses5-dev \
    libgdbm-dev \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libnss3-dev \
    libssl-dev \
    libreadline-dev \
    libffi-dev \
    libsqlite3-dev \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3.8 \
    unzip \
    vim \
    wget \
    libbz2-dev \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /home
COPY requirements.txt /tmp
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.8 10 \
  && python -V \
  && python -m pip install -U pip setuptools \
  && pip install -r /tmp/requirements.txt

COPY . /home
