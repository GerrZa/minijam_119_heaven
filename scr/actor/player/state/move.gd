extends PlayerState

var can_detected = false

func enter(msg:={}):
	can_detected = true
	
	Global.detected.connect(get_detected)

func physics_update(delta):
	
	player.velocity = player.p_input * player.speed
	
	player.statue_left += delta
	
	player.move_and_slide()

func update(delta):
	
	if player.p_input == Vector2.ZERO:
		state_machine.transition_to("idle")
	
	if Input.is_action_just_pressed("ui_space") and player.statue_cd.is_stopped():
		state_machine.transition_to("statue")
	
	if Input.is_action_just_pressed("ui_repair") and %repair_area.get_overlapping_areas().size() > 0:
		state_machine.transition_to("repair")
	
	if player.p_input != Vector2.ZERO:
		player.last_direction = player.p_input
	
	
	player.animtree.get("parameters/playback").travel("run")
	

func get_detected():
	state_machine.transition_to("detected")

func exit():
	
	can_detected = false
