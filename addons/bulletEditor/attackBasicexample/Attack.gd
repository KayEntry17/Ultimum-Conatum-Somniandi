@tool
extends Node2D
#@export var Title:String
var attlist
var circles
var player
var editorshowhidden:=false 
@export var time:=0.0
@export var endTime:=1000
@export var title:String
#func _ready() -> void:
	#time=0
func remake_list():
	attlist=[]
	for i in get_children():
		if i.get("saveProperties")!=null:
			var j =[]
			if i.has_method("savePrep"):
				i.savePrep()
			for k in i.saveProperties:
				j.append(i.get(k))
			attlist.append(j)
	attlist.sort_custom(func(a, b): return a[1] < b[1])
func rebuild_list():
	for i in attlist:
		var curscene=EditorInterface.get_edited_scene_root()
		var bulin=VISDES.lists.BulletObjects[i[0]].instantiate()
		var k=0
		for j in bulin.saveProperties:
			bulin.set(j, i[k])
			k+=1
		self.add_child(bulin)
		bulin.set_owner(self)
		
func cleared_bullets():
	for i in get_children():
		if i.get("saveProperties")!=null:		
			i.queue_free()
func loads():
	if not FileAccess.file_exists("res://attacks/"+title+".attack"):
		return
	else:
		
		var save_gamex = FileAccess.open("res://attacks/"+title+".attack", FileAccess.READ)
		while save_gamex.get_position()<save_gamex.get_length():
			var json_string =save_gamex.get_line()
			var json=JSON.new()
			var parse_result=json.parse(json_string)
			attlist=json.get_data()
			
func save():
	var save_game = FileAccess.open("res://attacks/"+title+".attack", FileAccess.WRITE)
	var json_string=JSON.stringify(attlist)
	save_game.store_line(json_string)
