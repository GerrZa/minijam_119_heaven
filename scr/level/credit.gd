extends Node2D

func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(4194305):
		get_tree().change_scene_to_file("res://scr/level/level1.tscn")

func _physics_process(delta: float) -> void:
	$Label.position.y -= 30 * delta
