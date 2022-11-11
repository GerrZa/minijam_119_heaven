extends PlayerState

var can_detected = false

func enter(msg:={}):
	player.velocity = Vector2.ZERO
	
	player.move_and_slide()
	
	can_detected = true
	Global.detected.connect(get_detected)

func update(delta):
	
	if player.p_input != Vector2.ZERO:
		state_machine.transition_to("move")
	
	if Input.is_action_just_pressed("ui_repair") and %repair_area.get_overlapping_areas().size() > 0:
		state_machine.transition_to("repair")
	

func get_detected():
	state_machine.transition_to("detected")

func exit():
	
	can_detected = false
