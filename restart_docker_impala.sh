#!/usr/bin/env bash

export IBIS_TEST_NN_HOST=impalalive
export IBIS_TEST_IMPALA_HOST=$IBIS_TEST_NN_HOST
export IBIS_TEST_IMPALA_PORT=21050
export IBIS_TEST_WEBHDFS_PORT=50070
export IBIS_TEST_WEBHDFS_USER=ubuntu

docker stop $IBIS_TEST_NN_HOST
docker rm $IBIS_TEST_NN_HOST

docker run -d -it --name $IBIS_TEST_NN_HOST \
    --hostname $IBIS_TEST_NN_HOST \
    -p $IBIS_TEST_WEBHDFS_PORT -p $IBIS_TEST_IMPALA_PORT \
    cpcloud86/impala:metastore

while ! docker exec $IBIS_TEST_NN_HOST impala-shell -q 'SELECT VERSION()'; do
    sleep 1
done
