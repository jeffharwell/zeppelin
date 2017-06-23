#!/bin/bash

#
# Run stand alone so that you can get access to Zeppelin on part 8080. Mostly
# for local testing.
#
# It is expecting Spark at spark://spark-master:7077, which works if you
# have everything set up that way in Kubernetics
#

docker run -p 8080:8080 --rm --name zeppelin jeffharwell/zeppelin:v0.7.2_v1
