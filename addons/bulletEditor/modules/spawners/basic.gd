
@tool
extends Node
var parent
@export var spawned_bullet:PackedScene
@export var timebetween:float=0.5
@export var assignmentlist:Dictionary[String, float]
@export var endtimeoffset:float=100
@export var count:int=0
var startTime
var endTime
func _ready() -> void:
	#print(bulcount)
	parent=get_parent()
	startTime=parent.startTime
	endTime=parent.modTime
	if count!=0:
		#startTime=parent.modTime
		endTime=startTime+count*timebetween

	for i in get_children():
		i.queue_free()
	var bulcount=(endTime-startTime)/timebetween
	#print(bulcount)
	for i in range(bulcount+0.1):
		var newbul=spawned_bullet.instantiate()
		newbul.startTime=startTime+i*timebetween
		newbul.endTime=	newbul.startTime+endtimeoffset
		var bulp=parent.move(newbul.startTime)
		newbul.bulposx=bulp.x
		newbul.bulposy=bulp.y
		for j in assignmentlist:
			#print(j)
			if j in newbul:
				newbul.set(j,assignmentlist[j])
		self.add_child(newbul)
#func _process(delta: float) -> void:
	#print(5612345615341)
	#if Engine.is_editor_hint():
		#_ready()
	
