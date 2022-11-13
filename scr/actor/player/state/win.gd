extends PlayerState

func enter(msg:={}):
	$"../../hitbox/CollisionShape2D".disabled = true
	
	get_tree().root.set_disable_input(true)

func physics_update(delta):
	
	player.animtree.get("parameters/playback").travel("idle")
