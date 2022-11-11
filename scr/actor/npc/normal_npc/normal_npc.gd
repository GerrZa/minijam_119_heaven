extends CharacterBody2D

var speed = 30

@export var path_in_order : Array[Vector2]

var current_point := 0

var last_view_direction = Vector2.UP

func _physics_process(delta):
	$RayCast2D.target_position = global_position.direction_to(Global.player.global_position) * global_position.distance_to(Global.player.global_position)
	
	$detect_area.look_at(global_position + velocity)
