@tool

extends Sprite2D
@export var progressbar: Node
var movable:=false
@export var percentdone:=100.0
func _process(delta: float) -> void:
	global_position.x=progressbar.global_position.x+percentdone/100*progressbar.size.x
	global_position.y=progressbar.global_position.y
