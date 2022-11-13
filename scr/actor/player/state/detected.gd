extends PlayerState

func enter(msg:={}):
	
	$"../../Alert".visible = true
	
	get_tree().root.set_disable_input(true)
	
	$"../../alertplayer".play()
	
	await get_tree().create_timer(0.5).timeout
	
	get_tree().current_scene.retry()

func physics_update(delta):
	
	player.animtree.get("parameters/playback").travel("idle")
