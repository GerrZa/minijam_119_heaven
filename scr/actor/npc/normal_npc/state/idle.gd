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
	
	$"../../npc_sprite/AnimationTree".get("parameters/playback").travel("idle")
	
	if %RayCast2D.is_colliding() == true and %detect_area.get_overlapping_areas().size() > 0 and %RayCast2D.get_collider().owner is Player:
		Global.emit_signal("detected")
		state_machine.transition_to("detected")
