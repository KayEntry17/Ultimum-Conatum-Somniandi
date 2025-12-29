@tool
extends LineEdit
var curscene=null
var currentlyedited=false

func _process(delta: float) -> void:
	var cursceneprev=curscene
	if Engine.is_editor_hint():
		curscene=Engine.get_singleton("EditorInterface").get_edited_scene_root()
	else:
		curscene=get_tree().current_scene
	
	if curscene!=null :
		
		if ("endTime" in curscene):
			
				
			if !currentlyedited or curscene!=cursceneprev:
				self.text=str(curscene.endTime)
			
			if VISDES.selected_node!=null:
				#print(VISDES.selected_node)
				for i in get_children():
					#print(i)
					if (i.name in VISDES.selected_node):
						i.visible=true
						i.percentdone=VISDES.selected_node.get(i.name)/curscene.endTime*100
					else:
						i.visible=false
			else:
				hide_all()

		else:
			hide_all()

	else:
		hide_all()
	


func _on_editing_toggled(toggled_on: bool) -> void:
	currentlyedited=!currentlyedited
func hide_all():
	for i in get_children():
			i.visible=false
func _on_text_submitted(new_text: String) -> void:
	if ("endTime" in curscene):
		
		curscene.endTime=float(text)
