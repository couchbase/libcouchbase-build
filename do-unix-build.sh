#!/bin/bash -ex

cd libcouchbase && mkdir build && cd build
../cmake/configure && make
