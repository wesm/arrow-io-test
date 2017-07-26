#!/usr/bin/env bash

# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http:#www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

export MINICONDA=$HOME/miniconda
export PATH="$MINICONDA/bin:$PATH"
export CONDA_PKGS_DIRS=$HOME/.conda_packages

export BUILD_DIR=`pwd`/arrow

# XXX
export BUILD_OS_NAME=linux

export ARROW_CPP_DIR=$BUILD_DIR/cpp
export ARROW_PYTHON_DIR=$BUILD_DIR/python
export ARROW_C_GLIB_DIR=$BUILD_DIR/c_glib
export ARROW_JAVA_DIR=${BUILD_DIR}/java
export ARROW_JS_DIR=${BUILD_DIR}/js
export ARROW_INTEGRATION_DIR=$BUILD_DIR/integration

export CPP_BUILD_DIR=$BUILD_DIR/cpp-build

export ARROW_CPP_INSTALL=$BUILD_DIR/cpp-install
export ARROW_CPP_BUILD_DIR=$BUILD_DIR/cpp-build
export ARROW_C_GLIB_INSTALL=$BUILD_DIR/c-glib-install

export CPP_TOOLCHAIN=$BUILD_DIR/cpp-toolchain
export ARROW_BUILD_TOOLCHAIN=$CPP_TOOLCHAIN
export BOOST_ROOT=$CPP_TOOLCHAIN
export PATH=$CPP_TOOLCHAIN/bin:$PATH
export LD_LIBRARY_PATH=$CPP_TOOLCHAIN/lib:$LD_LIBRARY_PATH
export MAKE=ninja
