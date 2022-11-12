class_name Player
extends CharacterBody2D

var p_input = Vector2.ZERO
var speed = 65
var acceleration = 30
var friction = 1

@onready var statue_active_timer = $statue_active
@onready var statue_cd = $statue_cd

var curr_state

func _ready():
	Global.win.connect(win)
	
	Global.player = self

func _physics_process(delta):
	
	print($fsm.state)
	
	curr_state = $fsm.state.name
	
	p_input.x = Input.get_axis("ui_left","ui_right")
	p_input.y = Input.get_axis("ui_up","ui_down")
	

func win():
	$fsm.transition_to("win")

func _exit_tree() -> void:
	Global.player = null
