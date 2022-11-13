extends Area2D

@export var repair_duration : float = 1
var current_repair = 0

var repair_percentage = 0

@export_node_path(Node2D) var repair_bar
@export_node_path(Node2D) var finish_repair
@export_node_path(Node2D) var repair_progress
@export_node_path(Sprite2D) var obj_sprite

func _ready() -> void:
	add_to_group("obj")

func _physics_process(delta):
	
	get_node(repair_bar).visible = get_overlapping_bodies().size() != 0
	get_node(repair_progress).scale.x = repair_percentage
	
	get_node(obj_sprite).use_parent_material = get_overlapping_bodies().size() == 0
	
	if repair_percentage >= 1:
		get_node(finish_repair).visible = false
		$repair_bar_root/finish.visible = true
		
	
	count_repair_percentage()

func count_repair_percentage():
	
	repair_percentage = current_repair/repair_duration

func repair(delta):
	
	current_repair += delta
