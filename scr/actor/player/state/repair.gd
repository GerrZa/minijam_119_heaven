extends PlayerState


func physics_update(delta):
	
	%repair_area.get_overlapping_areas()[0].repair(delta)

func update(delta):
	
	if Input.is_action_just_released("ui_repair"):
		if player.p_input != Vector2.ZERO:
			state_machine.transition_to("move")
		else:
			state_machine.transition_to("idle")
