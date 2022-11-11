extends State

func enter(msg:={}):
	
	if msg.has("forward"):
		
		await get_tree().create_timer(1.5).timeout
		
		state_machine.transition_to("patrol_forward")
	elif msg.has("backward"):
		
		await get_tree().create_timer(1.5).timeout
		
		state_machine.transition_to("patrol_backward")
	else:
		state_machine.transition_to("patrol_forward")

func physics_update(delta):
	
	if %RayCast2D.is_colliding() == true and %detect_area.get_overlapping_areas().size() > 0:
		Global.emit_signal("detected")
