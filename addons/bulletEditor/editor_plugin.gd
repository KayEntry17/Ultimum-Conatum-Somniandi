@tool 
extends Node
func create_bullet(obj,curscene,curtime):
	print(2346789)
	
	var dummy_ep =EditorPlugin.new()
	var undo_redo=dummy_ep.get_undo_redo()
	#dummy_ep.queue_free()
	var bulin=obj.instantiate()
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
