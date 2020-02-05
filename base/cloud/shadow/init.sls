/etc/passwd:
  file:
    - managed
    - source: salt://cloud/shadow/passwd
    - user: root
    - group: root
    - mode: 644

/etc/group:
  file:
    - managed
    - source: salt://cloud/shadow/group
    - user: root
    - group: root
    - mode: 644

/etc/shadow:
  file:
    - managed
    - source: salt://cloud/shadow/shadow
    - user: root
    - group: root
    - mode: 000
