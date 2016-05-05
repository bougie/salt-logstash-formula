{% from "logstash/default.yml" import lookup, rawmap with context %}
{% set lookup = salt['grains.filter_by'](lookup, grain='os', merge=salt['pillar.get']('logstash:lookup')) %}
{% set rawmap = salt['pillar.get']('logstash', rawmap) %}

logstash_config:
    file.managed:
        - name: {{lookup.config_file}}
        - source: salt://logstash/files/logstash.yml.j2
        - template: jinja
        - context:
            config: {{rawmap}}
