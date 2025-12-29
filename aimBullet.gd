@tool
extends LinearBullet
func _process(delta: float) -> void:
	#if !active and VISDES.curtime>startTime and VISDES.curtime<endTime:
		#print("focusing")
		#self.global_rotation=self.global_position.angle_to_point(VISDES.playerpos)
	super(delta)
