# Syslog to DataDog

Receive syslog messages and send to DataDog


## Build your image

```
# After customizing pipeline/*.conf

DOCKER_IMAGE=*************/syslog-to-datadog

docker build . -t ${DOCKER_IMAGE}
docker push ${DOCKER_IMAGE}
```

## Run the image


```
DD_API_KEY=****************************

docker run \
  -e DD_API_KEY=${DD_API_KEY} \
  -e XPACK_MANAGEMENT_ENABLED=false \
  -e XPACK_MONITORING_ENABLED=false \
  --rm \
  -p 5514:5514 \
  -p 9600:9600 \
  ${DOCKER_IMAGE}
```

send syslog message

```
echo <RFC5424 Message> | nc localhost 5514
```

check pipeline

```
curl http://localhost:9600/_node/stats/pipelines
```

## See also

* https://docs.developer.swisscom.com/service-offerings/logstash-docker.html
* https://github.com/making/cf-syslog-to-datadog
