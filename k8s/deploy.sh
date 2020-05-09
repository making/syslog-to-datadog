#!/bin/bash

set -ex

kubectl create -n observability configmap logstash-pipeline --from-file=../pipeline -o yaml --dry-run > config/pipeline.yml
kapp -a syslog-to-datadog deploy -c \
     -f <(ytt -f config -f values.yml \
     	      -v pipeline_hash=$(md5 -q config/pipeline.yml)) $@
