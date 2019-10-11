FROM ubuntu:16.04
MAINTAINER Himanshu Sahdev aka CunningLearner <sahdev.himan@gmail.com>

RUN \
	DEBIAN_FRONTEND=noninteractive apt-get -qq update && \
	DEBIAN_FRONTEND=noninteractive apt-get -qqy install \
		build-essential \
		ccache \
		git \
		iasl \
		libgcc-5-dev \
		nasm \
		python \
		python-pip \
		qemu \
		sudo \
		uuid-dev \
		vim \
		wget \
		zip \
	&& DEBIAN_FRONTEND=noninteractive apt-get clean

RUN pip install -q uefi_firmware

RUN useradd -m edk2 && \
	echo "edk2:edk2" | chpasswd && \
	adduser edk2 sudo

RUN mkdir /home/sandbox && mkdir /home/sandbox/.ccache && \
	chown edk2:edk2 /home/sandbox/.ccache

VOLUME /home/sandbox/.ccache

WORKDIR /home/sandbox

USER edk2
