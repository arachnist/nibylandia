M83                   ; Put the extruder into relative mode
G92 E0.0              ; Reset the extruder so that it thinks it is at position zero
; 60cm total, really
; faster
{% for n in range(10) %}
  G1 E50 F700
{% endfor %}
; slower
{% for n in range(2) %}
  G1 E50 F350
{% endfor %}
G92 E0.0
M82                   ; Put the extruder back into absolute mode.
