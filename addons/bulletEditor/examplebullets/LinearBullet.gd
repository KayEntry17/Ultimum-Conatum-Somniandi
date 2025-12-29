@tool
extends Node2D
class_name LinearBullet
@export_group("Editor")
#@export var saveProperties:Array[String]=["id","subtype","startTime","endTime","Damage","bulposx","bulposy"]
@export var id:int

@export var bulposx:float=0
@export var bulposy:float=0
@export_group("Behaviour")
@export var startTime:float=0
@export var endTime:float=100
@export var modTime:float=50
#@export var speed:float=10
@export var Damage:float=5
var  editorhidden:bool=false
var active=true
var time=0.0
@export var speed=10.0
@export var angle:float=0.0
@export var colhint:Color
@export_group("Editor")
@export var movable:Node2D
@export var saveProperties:Array[String]=["id","startTime","endTime","Damage","angle","bulposx","bulposy","speed"]
var inipos=Vector2(0,0)
var colshape:=false
var timess
func savePrep():
	angle=global_rotation_degrees+angle
	bulposx=global_position.x
	bulposy=global_position.y
func _ready() -> void:
	timess=VISDES.curtime
	if movable.get_child_count()!=0:
		if "disabled" in movable.get_child(0):
			colshape=true
	position=Vector2(bulposx,bulposy)
	
	inipos=global_position
	#print(101)
func move(times):
	return (Vector2((speed*(times-startTime))*cos(deg_to_rad(angle)),(speed*(times-startTime))*sin(deg_to_rad(angle))))
func _process(delta: float) -> void:
	timess=VISDES.curtime
	#print(active)
	if startTime<=timess and endTime>=timess:
		#movable.process_mode=Node.PROCESS_MODE_PAUSABLE
		active=true
		visible=true
		#print(active)
		movable.position=move(timess)
		if Engine.is_editor_hint():
			queue_redraw()
			
			if editorhidden :
				if VISDES.editorshowhidden:
					visible=true
				else:
					visible=false
		
	else:
		active=false
		#movable.process_mode=Node.PROCESS_MODE_DISABLED
		visible=false
		
		if timess>endTime and VISDES.realtime:
			queue_free()
			#print(VISDES.realtime)
	#print(visible)
	#print(active)
	
		#if colshape:
			#movable.get_child(0).disabled=!active
		#print(movable.get_child(0).disabled)
	
func _draw() -> void:
	if Engine.is_editor_hint():
		draw_line(Vector2(0,0), Vector2(1000*cos(deg_to_rad(angle)),1000*sin(deg_to_rad(angle))), colhint,3, false)
