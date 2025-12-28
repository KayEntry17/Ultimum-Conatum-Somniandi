@tool
extends BulletCoreDEV
class_name EmptyBullet
@export var saveProperties:Array[String]=["id","subtype","startTime","endTime","Damage","bulposx","bulposy"]
func _process(delta: float) -> void:
	print()
