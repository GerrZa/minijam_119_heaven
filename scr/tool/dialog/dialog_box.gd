extends Node2D

var dialog_content = [
	"Ughh, why do people keep wishing that their home appliances will be repaired.",
	"The company has many duties that I could fit in but they put me in the repairing section!?",
	"Anyway.",
	"Let's see how can I sneak in and repair those electronic thingy without getting caught."
]

var current_dialog_index = 0

var current_text = ""
var cd_per_letter = 0.03

var is_dialog_running = false

func _ready() -> void:
	
	$DialogEndIndicator.visible = false
	
	visible = true
	
	get_tree().paused = true
	
	set_physics_process(false)
	
	await get_tree().create_timer(1).timeout
	
	set_physics_process(true)
	
	$Label.text = dialog_content[0]
	
	$Label.visible_characters = 0
	
	current_text = dialog_content[current_dialog_index]
	
	run_dialog()

func _physics_process(delta: float) -> void:
	
	if $Label.visible_characters == $Label.text.length():
		is_dialog_running = false
	else:
		is_dialog_running = true
	
	if is_dialog_running == false:
		$DialogEndIndicator.visible = true
	else:
		$DialogEndIndicator.visible = false
	
	if Input.is_action_just_pressed("ui_accept"):
		if is_dialog_running:
			$Label.visible_characters = $Label.text.length()
		else:
			change_dialog()
	

func change_dialog():
	
	$Label.visible_characters = 0
	
	current_dialog_index += 1
	
	if current_dialog_index <= dialog_content.size() - 1:
		$Label.text = dialog_content[current_dialog_index]
	else:
		get_tree().paused = false
		
		queue_free()
	
	$Label.visible_characters = 0
	
	run_dialog()
	
	is_dialog_running = true
	


func run_dialog():
	
	while $Label.visible_characters < $Label.text.length():
		$Label.visible_characters += 1
		
		$AudioStreamPlayer2D.play()  
		
		$Timer.start(cd_per_letter)
		await $Timer.timeout
