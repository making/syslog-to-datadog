FROM docker.elastic.co/logstash/logstash:7.6.2

RUN rm -f /usr/share/logstash/pipeline/logstash.conf && \
    /usr/share/logstash/bin/logstash-plugin install logstash-output-datadog_logs

ADD pipeline/* /usr/share/logstash/pipeline/
