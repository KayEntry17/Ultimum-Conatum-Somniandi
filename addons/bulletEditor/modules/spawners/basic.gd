
@tool
extends Node
var parent
@export var spawned_bullet:PackedScene
@export var timebetween:float=0.5
var startTime
var endTime
func _ready() -> void:
	parent=get_parent()
	startTime=parent.modtime
	endTime=parent.endTime
	var bulcount=(startTime-endTime)/timebetween
func _process(delta: float) -> void:

	if Engine.is_editor_hint():
		_ready()
	
