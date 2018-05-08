#!/bin/bash

xrand --setprovideroutputsource modesetting NVIDIA-0
xrand --auto
twmnd &
exec i3 -V >> ~/.i3log 2>&1
