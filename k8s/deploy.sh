#!/bin/bash

set -ex

ytt -f config -f values.yml -v pipeline_hash=$(shasum config/pipeline.yml | awk '{print $1}') > /tmp/deploy.yml
kubectl create -n observability configmap logstash-pipeline --from-file=../pipeline -o yaml --dry-run > config/pipeline.yml
kapp -a syslog-to-datadog deploy -c -f /tmp/deploy.yml $@
