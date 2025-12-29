@tool
extends Control
@export var tabarr: Array[GridContainer]
@export var bulidcur=0
@onready var pallete_button=preload("res://addons/bulletEditor/docks/Pallete_Button.tscn")
func _ready() -> void:
	refresh_list()
func refresh_list():
	
	for i in tabarr:
		for j in i.get_children():
			j.queue_free()
	for i in range(VISDES.bullist.BulletObjects.size()):
		var newen=pallete_button.instantiate()
		newen.bulid=i
		newen.sprite=VISDES.bullist.BulletTextures[i]
		newen.connect("chosen", on_chosen)
		tabarr[VISDES.bullist.BulletCategories[i]].add_child(newen)
func _process(delta: float) -> void:
	#print("argvark")	
	if VISDES.curid<0:
		on_chosen(-1)
		#print("argvark")		
func on_chosen(bulid: int):
	for i in tabarr:
		for j in i.get_children():
			if j.bulid!=bulid:
				j.button_pressed=false
			else:
				j.button_pressed=true
	bulidcur=bulid
	VISDES.curid=bulid
