@tool
extends BulletCoreDEV
class_name LinearBullet
@export var speed=10.0
@export var angle:float=0.0
@export var colhint:Color
@export_group("Editor")
@export var movable:Node2D
@export var saveProperties:Array[String]=["id","startTime","endTime","Damage","angle","bulposx","bulposy","speed"]
var inipos=Vector2(0,0)
var colshape:=false
func savePrep():
	angle=global_rotation_degrees+angle
	bulposx=global_position.x
	bulposy=global_position.y
func _ready() -> void:
	if movable.get_child_count()!=0:
		if "disabled" in movable.get_child(0):
			colshape=true
	global_position=Vector2(bulposx,bulposy)
	
	inipos=global_position
	#print(101)
func move():
	return (Vector2((speed*(VISDES.curtime-startTime))*cos(deg_to_rad(angle)),(speed*(VISDES.curtime-startTime))*sin(deg_to_rad(angle))))
func _process(delta: float) -> void:
	#_ready()
	#print(self)
	#print(Vector2(bulposx,bulposy))
	super(delta)
	movable.position=move()
	queue_redraw()
	if colshape:
		movable.get_child(0).disabled=!active
		#print(movable.get_child(0).disabled)
		
func _draw() -> void:
	if Engine.is_editor_hint():
		draw_line(Vector2(0,0), Vector2(1000*cos(deg_to_rad(angle)),1000*sin(deg_to_rad(angle))), colhint,3, false)
