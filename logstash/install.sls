{% from "logstash/default.yml" import lookup, rawmap with context %}
{% set lookup = salt['grains.filter_by'](lookup, grain='os', merge=salt['pillar.get']('logstash:lookup')) %}
{% set rawmap = salt['pillar.get']('logstash', rawmap) %}

{% set os_family = salt['grains.get']('os_family') %}
{% if os_family == 'Debian' or os_family == 'CentOS' %}
    {% if salt['grains.get']('os_family') == 'Debian' %}
apt_https_transport:
    pkg.latest:
       - name: apt-transport-https
    {% endif %}

logstash_repo:
    pkgrepo.managed:
        - humanname: logstash Repository
        - name: {{lookup.repo_url}}
        - dist: stable
        - file: {{lookup.repo_file}}
        - key_url: {{lookup.gpg_url}}
        - refresh_db: True
    {% if salt['grains.get']('os_family') == 'Debian' %}
        - require:
            - pkg: apt_https_transport
    {% endif %}
{% endif %}

logstash_package:
    pkg.installed:
        - name: {{lookup.package}}
{% if os_family == 'Debian' or os_family == 'CentOS' %}
        - require:
            - pkgrepo: logstash_repo
{% endif %}
