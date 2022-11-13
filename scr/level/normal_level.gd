extends Node2D

var closer = preload("res://scr/tool/transitioner/closer.tscn")

@export var next_level : String = ""

var winned = false

func _physics_process(delta):
	
	var repaired_obj = 0
	
	for obj in get_tree().get_nodes_in_group("obj"):
		if obj.repair_percentage >= 1:
			repaired_obj += 1
	
	if repaired_obj == get_tree().get_nodes_in_group("obj").size() and winned == false and $win_area.get_overlapping_bodies().size() > 0:
		win()

func win():
	winned = true
	
	Global.emit_signal("win")
	
	var closer_ins = closer.instantiate()
	
	$CanvasLayer.add_child(closer_ins)
	
	closer_ins.new_scene_path = next_level
	

func retry():
	
	var closer_ins = closer.instantiate()
	
	$CanvasLayer.add_child(closer_ins)
	
	closer_ins.new_scene_path = get_tree().current_scene.scene_file_path
	
