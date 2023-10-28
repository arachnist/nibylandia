G92 E0
{% if (printer.toolhead.extruder) == "extruder" %}
  {% set prime_x = 3 %}
{% else %}
  {% set prime_x = 4 %}
{% endif %}
M117 priming first line
G1 X{ prime_x } Y3 Z0.3 F5000.0
G1 E3 F3000
G1 X{ prime_x } Y143.0 Z0.3 F3000.0 E20
M117 priming second line
G1 X{ prime_x + 2 } Y143.0 Z0.3 F5000.0
G1 X{ prime_x + 2 } Y3 Z0.3 F3000 E40
G92 E0
G1 Z2.0 F3000
