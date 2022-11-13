extends ColorRect

var new_scene_path = "res://scr/level/test_room.tscn"

func _ready():
	
	$AnimationPlayer.play("close")
	
	get_tree().root.set_disable_input(true)
	
	await $AnimationPlayer.animation_finished
	
	get_tree().change_scene_to_file(new_scene_path)
	
	queue_free()
	
