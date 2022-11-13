class_name Player
extends CharacterBody2D

var p_input = Vector2.ZERO
var speed = 65
var acceleration = 30
var friction = 1

@onready var statue_active_timer = $statue_active
@onready var statue_cd = $statue_cd

var curr_state

var last_direction = Vector2.DOWN

@onready var animtree = $player_sprite/AnimationTree

var statue_left = 5
var max_statue = 5

func _ready():
	Global.win.connect(win)
	
	Global.player = self

func _physics_process(delta):
	
	$statue_anchor.scale.x = statue_left/max_statue
	
	if statue_left/max_statue >= 1:
		$statue_anchor.visible = false
	else:
		$statue_anchor.visible = true
	
	if statue_left >= max_statue:
		statue_left = max_statue
	
	
	curr_state = $fsm.state.name
	
	p_input.x = Input.get_axis("ui_left","ui_right")
	p_input.y = Input.get_axis("ui_up","ui_down")
	
	p_input = p_input.normalized()
	
	animtree.set("parameters/idle/blend_position",last_direction)
	animtree.set("parameters/run/blend_position",last_direction)
	

func win():
	$fsm.transition_to("win")

func _exit_tree() -> void:
	Global.player = null
