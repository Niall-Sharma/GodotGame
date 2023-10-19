extends Button
var lvl_num
var enabled = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_sdelta):
	pass


func _on_pressed():
	if enabled:
		Globalvars.setLevel(lvl_num)
		get_tree().change_scene_to_file("res://Master/master.tscn")
	
	
