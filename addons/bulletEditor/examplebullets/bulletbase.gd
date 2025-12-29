@tool
extends Node2D
class_name BulletCoreDEV
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
var visedh
var time=0.0
func  _process(delta: float) -> void:
	#print(278137891)
	
	if Engine.is_editor_hint() and editorhidden and !VISDES.editorshowhidden:
		visedh=false 
		
	else:
		visedh=true
	if startTime<=VISDES.curtime and endTime>=VISDES.curtime:
		active=true
	else:
		active=false
	if active and visedh:
		visible=true
	else:
		visible=false
