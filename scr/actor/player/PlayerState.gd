class_name PlayerState
extends State

var player : Player = null

func _ready():
	
	await owner.ready
	player = owner
	assert(player != null)
