/etc/hosts:
  file.managed:
    - mode: 0744
    - replace: true
    - user: root
    - group: root
    - contents_pillar: hosts
