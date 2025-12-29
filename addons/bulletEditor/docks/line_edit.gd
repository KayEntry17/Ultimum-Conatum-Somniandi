@tool
extends LineEdit
var curscene=null
var currentlyedited=false
var beingdragged=false
@export var timeLine:HSlider
func _process(delta: float) -> void:
	var cursceneprev=curscene
	if Engine.is_editor_hint():
		curscene=Engine.get_singleton("EditorInterface").get_edited_scene_root()
	else:
		curscene=get_tree().current_scene
	
	if curscene!=null :
		
		if ("time" in curscene):
			if "endTime" in curscene:
				if !beingdragged or curscene!=cursceneprev:
					timeLine.value=curscene.time/curscene.endTime*100
					
				else:
					curscene.time=timeLine.value*curscene.endTime/100
					#print(curscene.endTime)
					
					
					
			if !currentlyedited or curscene!=cursceneprev:
				self.text=str(curscene.time)
	
	


func _on_editing_toggled(toggled_on: bool) -> void:
	currentlyedited=!currentlyedited


func _on_text_submitted(new_text: String) -> void:
	if ("time" in curscene):
		
		curscene.time=float(text)
func _on_progress_bar_drag_started() -> void:
	beingdragged=true


func _on_progress_bar_drag_ended(value_changed: bool) -> void:
	beingdragged=false
