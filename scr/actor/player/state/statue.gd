extends PlayerState


func enter(msg:={}):
	
	$"../../hitbox/CollisionShape2D".disabled = true
	
	player.statue_active_timer.start(0.85)
	
	await player.statue_active_timer.timeout
	
	player.statue_cd.start(0.90)
	
	if player.p_input == Vector2.ZERO:
		state_machine.transition_to("idle")
	else:
		state_machine.transition_to("move")

func exit():
	$"../../hitbox/CollisionShape2D".disabled = false
