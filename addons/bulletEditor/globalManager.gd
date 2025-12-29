@tool
extends Node
@export var bullist: Resource
var curscene
var curid:int=0
var mode:int
var editorshowhidden=false
var curtime:float=0
var curbul
var eds
var selected_node
var player: Node
var playerpos:Vector2
var playing=false
var selected
var realtime=true
func _ready() -> void:
	print()
	if Engine.is_editor_hint():
		curscene=Engine.get_singleton("EditorInterface").get_edited_scene_root()
		realtime=false
	else:
		curscene=get_tree().current_scene
	if Engine.is_editor_hint():
		var dummy_ep = Engine.get_singleton("EditorPlugin").new()
		eds =dummy_ep.get_editor_interface().get_selection()
		eds.selection_changed.connect(_on_selection_changed)
		dummy_ep.queue_free()
	else:
		playing=true
		if ("time" in curscene):
			curscene.time=0
		
	
func _on_selection_changed():
	
	selected = eds.get_selected_nodes() 
	if selected.size()!=0:
		selected_node = selected[0]
	else:
		selected_node=null
		
func _process(delta: float) -> void:
	#print(selected)
	
	if player!=null:
		playerpos=player.global_position
	else:
		playerpos=Vector2(0,0)
	
	if Engine.is_editor_hint():
		curscene=Engine.get_singleton("EditorInterface").get_edited_scene_root()
	else:
		curscene=get_tree().current_scene
	#print(curscene.time)
	if curscene!=null:
		if ("time" in curscene):
			curtime=curscene.time
			if playing:
				curscene.time+=delta*2
		else:
			curtime=0
		if Input.is_action_just_pressed("ui_accept") and Input.is_key_pressed(KEY_CTRL) and curid>=0:
		
			create_bullet()
		#print("kys")
func create_bullet():
	var id=curid
	var dummy_ep =Engine.get_singleton("EditorPlugin").new()
	var undo_redo=dummy_ep.get_undo_redo()
	dummy_ep.queue_free()
	var bulin=bullist.BulletObjects[id].instantiate()
	undo_redo.create_action("Bullet Created")
	bulin.bulposx=curscene.get_global_mouse_position().x
	bulin.startTime=curtime
	bulin.endTime=curtime+100
	bulin.bulposy=curscene.get_global_mouse_position().y
	undo_redo.add_do_method(curscene, "add_child", bulin);
	undo_redo.add_do_method(bulin, "set_owner", curscene);
	undo_redo.add_do_reference(bulin);	
	undo_redo.add_undo_method(curscene, "remove_child", bulin);
	undo_redo.commit_action()
func hide(button):
	for i in selected:
		print(i)
		if "editorhidden" in i:
			print(i)
			i.editorhidden=true
func unhide(button):
	for i in selected:
		if "editorhidden" in i:
			print(i)
			i.editorhidden=false
func play_stop(button):
	if button.on==true:
		button.turnon()
		playing=true
	else:
		button.turnoff()
		playing=false
func ghost(button):
	if button.on==true:
		button.turnon()
		editorshowhidden=true
	else:
		button.turnoff()
		editorshowhidden=false
func move(button):
	curid=-1
func save(button):
	if curscene!=null:
		if curscene.has_method("save"):
			curscene.save()
func loads(button):
	if curscene!=null:
		if curscene.has_method("loads"):
			curscene.loads()
