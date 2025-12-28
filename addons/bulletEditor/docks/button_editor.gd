@tool
extends TextureButton
@export var function:String

@export var coloron:Color
@export var coloroff:Color

var on:=false
func turnoff():
	self_modulate=coloroff
func turnon():
	self_modulate=coloron
	


func _on_pressed() -> void:
	on=!on
	var callabble=Callable(VISDES,function)
	callabble.call(self)
