extends Button
var lvl_num

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_sdelta):
	pass


func _on_pressed():
	Globalvars.check_lock()
	get_tree().change_scene_to_file("res://Master/master.tscn")
	Globalvars.setLevel(lvl_num)
	
