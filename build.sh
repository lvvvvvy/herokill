#########################################################################
# File Name: build.sh
# Author: lvy
# mail: imlvyong@163.com
# Created Time: Fri 16 Dec 2022 07:54:35 PM CST
#########################################################################

#!/bin/sh

set -x

SOURCE_DIR=`pwd`
BUILD_DIR=${BUILD_DIR:-../build}
BUILD_TYPE=${BUILD_TYPE:-release}
INSTALL_DIR=${INSTALL_DIR:-../${BUILD_TYPE}-install-cpp11}
CXX=${CXX:-g++}

ln -sf $BUILD_DIR/$BUILD_TYPE-cpp11/compile_commands.json

mkdir -p $BUILD_DIR/$BUILD_TYPE-cpp11 \
	&& cd $BUILD_DIR/$BUILD_TYPE-cpp11 \
	&& cmake \
	-DCMAKE_BUILD_TYPE=$BUILD_TYPE \
	-DCMAKE_INSTALL_PREFIX=$INSTALL_DIR \
	-DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
	$SOURCE_DIR \
	&& make $*
