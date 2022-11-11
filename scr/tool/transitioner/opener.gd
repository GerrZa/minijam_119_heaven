extends ColorRect


func _ready():
	
	tween()
	

func tween():
	
	var tween :=  get_tree().create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self,"shader_parameter/progress",1.0,8)
#"shader_parameter/progress"
