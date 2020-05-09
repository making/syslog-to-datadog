
After updating `../pipeline` directory, run

```
kubectl create -n observability configmap logstash-pipeline --from-file=../pipeline -o yaml --dry-run > config/pipeline.yml
```

```
cp k8s/sample-values.yml k8s/values.yml
# Update CHANGEME in k8s/values.yml
kapp -a syslog-to-datadog deploy -c \
     -f <(ytt -f k8s/config -f k8s/values.yml)
or

kapp -a syslog-to-datadog deploy -c \
     -f <(ytt -f k8s/config -f k8s/sample-values.yml \
              -v dd_api_key=XXXXXXXX)
```