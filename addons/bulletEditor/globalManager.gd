@tool
extends Node
@export var bullist: Resource
var curscene
var curid:int=0
var mode:int
var editorshowhidden=true
var curtime:float=0
func _process(delta: float) -> void:
	curscene=EditorInterface.get_edited_scene_root()
	if ("time" in curscene):
		curtime=curscene.time
	else:
		curtime=0
	if Input.is_action_just_pressed("ui_accept") and Input.is_key_pressed(KEY_CTRL) and curid>=0:
	
		create_bullet()
		#print("kys")
func create_bullet():
	var id=curid
	var dummy_ep =EditorPlugin.new()
	var undo_redo=dummy_ep.get_undo_redo()
	dummy_ep.queue_free()
	var bulin=bullist.BulletObjects[id].instantiate()
	undo_redo.create_action("Bullet Created")
	bulin.position.x=curscene.get_global_mouse_position().x
	bulin.position.y=curscene.get_global_mouse_position().y
	undo_redo.add_do_method(curscene, "add_child", bulin);
	undo_redo.add_do_method(bulin, "set_owner", curscene);
	undo_redo.add_do_reference(bulin);	
	undo_redo.add_undo_method(curscene, "remove_child", bulin);
	undo_redo.commit_action()
	
