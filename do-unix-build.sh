#!/bin/bash -ex

# Global define
PRODUCT=${1}
RELEASE=${2}
VERSION=${3}
BLD_NUM=${4}

# Download source
env
echo "Downloading source..."
curl -LO http://latestbuilds.service.couchbase.com/builds/latestbuilds/${PRODUCT}/${RELEASE}/${BLD_NUM}/${PRODUCT}-${VERSION}-${BLD_NUM}-source.tar.gz
echo "Extracting source..."
tar xzf ${PRODUCT}-${VERSION}-${BLD_NUM}-source.tar.gz

# Perform build
cd libcouchbase && mkdir build && cd build
../cmake/configure && make
