SET_GCODE_OFFSET X=0 Y=0 Z=0
SAVE_GCODE_STATE
{% if printer.toolhead.position.z + 6 < printer.toolhead.axis_minimum.z %}
G91
G1 Z5
G90
{% endif %}
G1 X220 Y15 F10000
RESTORE_GCODE_STATE MOVE=1 MOVE_SPEED=100
SET_GCODE_OFFSET X=0 Y=0 Z=-0.1
ACTIVATE_EXTRUDER EXTRUDER=extruder
M117 T0 active
