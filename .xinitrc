#!/bin/bash

twmnd &
exec i3 -V >> ~/.i3log 2>&1
