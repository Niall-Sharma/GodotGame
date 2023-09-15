extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Options.visible = false
	$Options.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_options_button_pressed():
	$Options.visible = true
	$Main.visible = false
	



func _on_quit_button_pressed():
	get_tree().quit() 


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Level1/level_1.tscn")
