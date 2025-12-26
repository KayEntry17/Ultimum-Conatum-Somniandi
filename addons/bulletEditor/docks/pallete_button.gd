@tool
extends TextureButton
@export var bulid: int
@export var sprite: Texture
signal chosen
func _ready() -> void:
	$CenterContainer/TextureRect.texture=sprite


func _on_pressed() -> void:
	#chosen.emit(bulid)
	if button_pressed:
		chosen.emit(bulid)
	else:
		chosen.emit(-1)
