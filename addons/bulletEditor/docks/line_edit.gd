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
		
		if ("time" in curscene):
			print(curscene)
			if !currentlyedited or curscene!=cursceneprev:
				self.text=str(curscene.time)
	
	


func _on_editing_toggled(toggled_on: bool) -> void:
	currentlyedited=!currentlyedited


func _on_text_submitted(new_text: String) -> void:
	if ("time" in curscene):
		
		curscene.time=float(text)
