# arrow-io-test

Continuous integration for the trickier bits in Apache Arrow

# Running the tests

```shell
docker run --rm -v $PWD:/io -it -d --name impala cpcloud86/impala:metastore

docker run -d -it --name $IBIS_TEST_NN_HOST \
       --hostname $IBIS_TEST_NN_HOST \
       -p $IBIS_TEST_WEBHDFS_PORT \
       -p $IBIS_TEST_IMPALA_PORT \
       cpcloud86/impala:metastore
while ! docker exec $IBIS_TEST_NN_HOST impala-shell -q 'SELECT VERSION()'; do
      sleep 1
done
```