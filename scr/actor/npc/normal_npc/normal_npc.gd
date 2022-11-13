extends CharacterBody2D

var speed = 30

@export var path_in_order : Array[Vector2]

var current_point := 0

var last_view_direction = Vector2.UP

@export var last_direction_anim := Vector2.DOWN

func _physics_process(delta):
	
	
	if Global.player != null:
		$RayCast2D.target_position = global_position.direction_to(Global.player.global_position) * global_position.distance_to(Global.player.global_position)
	
	$detect_area.look_at(global_position + velocity)
	
	
	if velocity != Vector2.ZERO:
		last_direction_anim = velocity.normalized()
	
	$npc_sprite/AnimationTree.set("parameters/idle/blend_position",last_direction_anim)
	$npc_sprite/AnimationTree.set("parameters/run/blend_position",last_direction_anim)
