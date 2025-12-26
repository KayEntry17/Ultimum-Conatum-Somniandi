@tool
extends EditorPlugin
var docktimeline
var dockpallete
func _enable_plugin() -> void:
	# Add autoloads here.
	pass


func _disable_plugin() -> void:
	# Remove autoloads here.
	pass


func _enter_tree() -> void:
	dockpallete= preload("res://addons/bulletEditor/docks/dockPallete.tscn").instantiate()
	docktimeline = preload("res://addons/bulletEditor/docks/dockTimeline.tscn").instantiate()
	add_control_to_dock(DOCK_SLOT_RIGHT_BL, dockpallete)
	add_control_to_bottom_panel(docktimeline, "Timeline")
	
	pass


func _exit_tree() -> void:
	remove_control_from_bottom_panel(docktimeline)
	remove_control_from_docks(dockpallete)
	docktimeline.free()
	dockpallete.free()
	pass
