extends Control
@export var tabarr: Array[GridContainer]
func refresh_list():
	for i in tabarr:
		for j in i.get_children():
			j.queue_free()
