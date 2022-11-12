extends ColorRect

func _ready():
	
	get_tree().root.set_disable_input(true)
	
	await $AnimationPlayer.animation_finished
	
	get_tree().root.set_disable_input(false)
	
