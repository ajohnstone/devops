#!/bin/bash
ES_HOST=${ES_HOST:-'elasticsearch-logging'};
ES_PORT=${ES_PORT:-9200};
ES_INDEX_NAME=${ES_INDEX_NAME:-'fluentd'};

[ -e /etc/td-agent/conf.d/output-elasticsearch.conf ] && {
        sed -i -r "s/%%ES_HOST%%/${ES_HOST}/g;s/%%ES_PORT%%/${ES_PORT}/g;s/%%ES_INDEX_NAME/${ES_INDEX_NAME}/g;" /etc/td-agent/conf.d/output-elasticsearch.conf
}
exec td-agent $@

