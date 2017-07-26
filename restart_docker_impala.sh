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

export IBIS_TEST_NN_HOST=impalalive
export IBIS_TEST_IMPALA_HOST=$IBIS_TEST_NN_HOST
export IBIS_TEST_IMPALA_PORT=21050
export IBIS_TEST_WEBHDFS_PORT=50070
export IBIS_TEST_WEBHDFS_USER=ubuntu

docker stop $IBIS_TEST_NN_HOST
docker rm $IBIS_TEST_NN_HOST

docker run -d -it --name $IBIS_TEST_NN_HOST \
       -v $PWD:/io \
       --hostname $IBIS_TEST_NN_HOST \
       -p $IBIS_TEST_WEBHDFS_PORT -p $IBIS_TEST_IMPALA_PORT \
       arrow-io-test

while ! docker exec $IBIS_TEST_NN_HOST impala-shell -q 'SELECT VERSION()'; do
    sleep 1
done
