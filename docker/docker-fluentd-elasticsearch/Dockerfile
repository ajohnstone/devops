FROM gcr.io/google_containers/ubuntu-slim:0.4
MAINTAINER Alex Robinson "arob@google.com"
MAINTAINER Jimmi Dyson "jimmidyson@gmail.com"

# Ensure there are enough file descriptors for running Fluentd.
RUN ulimit -n 65536

# Disable prompts from apt.
ENV DEBIAN_FRONTEND noninteractive \
    ES_HOST=elasticsearch-logging \
    ES_PORT=9200 \
    ES_INDEX_NAME=fluentd

RUN mkdir -p /var/log/td-agent/ \
             /etc/td-agent/conf.d/
RUN apt-get update && apt-get install apt-utils -y

# Copy the Fluentd configuration file.
COPY run.sh /run.sh
COPY build.sh /tmp/build.sh
COPY conf.d/ td-agent.conf /etc/td-agent/

RUN /tmp/build.sh

# Run the Fluentd service.
ENTRYPOINT ["bash","/run.sh"]
