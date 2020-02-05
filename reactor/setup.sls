minion_highstate:
  local.state.apply:
    - tgt: {{ data['id'] }}
