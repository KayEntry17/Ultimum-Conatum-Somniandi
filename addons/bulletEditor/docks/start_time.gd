@tool
extends LineEdit
var curscene=null
var currentlyedited=false
func _process(delta: float) -> void:
	var cursceneprev=curscene
	if Engine.is_editor_hint():
		curscene=EditorInterface.get_edited_scene_root()
	else:
		curscene=get_tree().current_scene
	
	if curscene!=null :
		
		if ("endTime" in curscene):
			#print(curscene)
			if !currentlyedited or curscene!=cursceneprev:
				self.text=str(curscene.endTime)
			
			if VISDES.selected_node!=null:
				#print(VISDES.selected_node)
				for i in get_children():
					#print(i)
					if (i.name in VISDES.selected_node):
						i.percentdone=VISDES.selected_node.get(i.name)/curscene.endTime*100
	
	


func _on_editing_toggled(toggled_on: bool) -> void:
	currentlyedited=!currentlyedited


func _on_text_submitted(new_text: String) -> void:
	if ("endTime" in curscene):
		
		curscene.endTime=float(text)
