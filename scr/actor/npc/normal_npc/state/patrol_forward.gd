extends State

func physics_update(delta):
	
	if owner.global_position.distance_to(owner.path_in_order[owner.current_point]) <= 0.25 and owner.current_point < owner.path_in_order.size() - 1:
		owner.global_position = owner.path_in_order[owner.current_point]
		owner.current_point += 1
	elif owner.global_position.distance_to(owner.path_in_order[owner.current_point]) <= 0.25 and owner.current_point >= owner.path_in_order.size() - 1:
		owner.global_position = owner.path_in_order[owner.current_point]
		state_machine.transition_to("idle",{"backward":true})
	
	owner.velocity = owner.global_position.direction_to(owner.path_in_order[owner.current_point]) * owner.speed
	
	owner.move_and_slide()
	
	if %RayCast2D.is_colliding() == true and %detect_area.get_overlapping_areas().size() > 0:
		Global.emit_signal("detected")
		state_machine.transition_to("detected")
