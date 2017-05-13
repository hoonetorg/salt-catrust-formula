# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "catrust/map.jinja" import catrust with context %}

/tmp/catrust.yaml:
  file.managed:
    - contents: |
        {{catrust|yaml(False)|indent(8)}}
