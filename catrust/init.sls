# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "catrust/map.jinja" import catrust with context %}

{% for cacert,cacert_data in catrust.cacerts.items() %}
catrust__cacert_{{cacert}}:
  file.managed:
    - name: {{catrust.cadir}}/{{cacert}}.{{catrust.cafileext}}
    - contents_pillar: catrust:cacerts:{{cacert}}:cert
    - mode: '0644'
    - user: root
    - group: root
    - watch_in:
      - cmd: catrust__update
{% endfor%}

catrust__update:
  cmd.watch:
    - name: {{catrust.updatecmd}}
