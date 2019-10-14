#!/bin/bash

USER="himan14"
IMAGE="edk2"

docker build -it $USER/$IMAGE:latest .
