extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$"GUI/Pause Menu".hide()
	$"GUI/PauseMenuBackground".hide()
	$MainTheme.play()
	AudioServer.set_bus_layout(load("res://default_bus_layout.tres"))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_pause_button_pressed():
	get_tree().paused = true
	$"GUI/Pause Menu".show()
	$GUI/PauseButton.hide()
	$GUI/PauseMenuBackground.show()



func _on_master_volume_value_changed(value):

	AudioServer.set_bus_volume_db(0,value)
	if value == -20:
		AudioServer.set_bus_mute(0, true)
	else :
		AudioServer.set_bus_mute(0,false)





func _on_back_button_pressed():
	get_tree().paused = false
	$GUI/PauseButton.show()
	$"GUI/Pause Menu".hide()
	$GUI/PauseMenuBackground.hide()


func _on_menu_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://MainMenu/MainMenu.tscn")
