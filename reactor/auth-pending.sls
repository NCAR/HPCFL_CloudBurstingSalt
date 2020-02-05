#{# failed to authenticate -- remove accepted key #}
#{% if not data['result'] and data['id'].startswith('aws') %}
#minion_remove:
#  wheel.key.delete:
#    - match: {{ data['id'] }}
#minion_rejoin:
#  local.cmd.run:
#    - tgt: salt-master.domain.tld
#    - args:
#    - cmd: ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no "{{ data['id'] }}" 'sleep 10 && sudo systemctl restart salt-minion && sleep 10'
#{% endif %}
#{# server is sending new key -- accept this key #}
{% if 'act' in data and data['act'] != 'accept' and data['id'].startswith('aws') %}
minion_add:
  wheel.key.accept:
    - match: {{ data['id'] }}
{% endif %}
