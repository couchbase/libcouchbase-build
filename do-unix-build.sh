#!/bin/bash -ex

mkdir build && cd build
cmake -DLCB_NO_TESTS=1 .. && make
