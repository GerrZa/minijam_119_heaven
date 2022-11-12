extends Node2D

var closer = preload("res://scr/tool/transitioner/closer.tscn")
var test_shit = preload("res://scr/obj/obj_template.tscn")

@export var next_level : String = ""

var winned = false

func _physics_process(delta):
	
	var repaired_obj = 0
	
	for obj in $ysort/obj_manager.get_children():
		if obj.repair_percentage >= 1:
			repaired_obj += 1
	
	if repaired_obj == $ysort/obj_manager.get_child_count() and winned == false and $win_area.get_overlapping_bodies().size() > 0:
		win()

func win():
	winned = true
	
	Global.emit_signal("win")
	
	var closer_ins = closer.instantiate()
	var test_shit_ins = test_shit.instantiate()
	
	$CanvasLayer.add_child(closer_ins)
	
	closer_ins.new_scene_path = next_level
	
