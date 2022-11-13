extends PlayerState

func enter(msg:={}):
	
	$"../../statueplayer".play()

func physics_update(delta):
	
	player.animtree.get("parameters/playback").travel("statue")
	
	$"../../hitbox/CollisionShape2D".disabled = true
	
	player.statue_left -= delta
	
	if Input.is_action_just_released("ui_space") or player.statue_left <= 0:
		if player.p_input == Vector2.ZERO:
			state_machine.transition_to("idle")
		else:
			state_machine.transition_to("move")
	
	
	
	player.animtree.get("parameters/playback").travel("statue")


func exit():
	$"../../hitbox/CollisionShape2D".disabled = false
