@tool
extends Node
var parent
func _ready() -> void:
	parent=get_parent()
	parent.angle=rad_to_deg(parent.global_position.angle_to_point(VISDES.playerpos))
	parent.global_rotation=0
func _process(delta: float) -> void:

	if Engine.is_editor_hint():
		parent=get_parent()
	if !parent.active and VISDES.curtime>parent.startTime-1 and VISDES.curtime<parent.endTime:
		#print("focusing")
		
		parent.angle=rad_to_deg(parent.global_position.angle_to_point(VISDES.playerpos))
		parent.global_rotation=0
