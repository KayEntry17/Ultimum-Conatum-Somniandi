extends TextureButton
@export var bulid: int
@export var sprite: Texture
func _ready() -> void:
	$CenterContainer/TextureRect.texture=sprite
