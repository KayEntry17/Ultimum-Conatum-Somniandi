@tool
extends BulletCoreDEV
class_name LinearBullet
@export var saveProperties:Array[String]=["id","subtype","startTime","endTime","Damage","bulposx","bulposy"]
@export_group("Behaviour")
@export var speed=10.0
@export var angle:float=10.0
func move():
	return (Vector2((speed*(VISDES.curtime-startTime))*cos(deg_to_rad(angle)),(speed*(VISDES.curtime-startTime))*sin(deg_to_rad(angle))))
func _process(delta: float) -> void:
	self.global_position=move()
