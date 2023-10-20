extends Node2D
var testvar =  preload("res://Level1/level_1.tscn")
var levels = [preload("res://Level1/level_1.tscn"),preload("res://Level2/level_2.tscn")]
var infiniteLevel = preload("res://Infinite/ran.tscn")
var coinCounter

#Takes a float as a parameter. Uses x as an index and selects level from levels array. Adds level as child of master. 
func _change_level(x):
	var level = levels[x].instantiate()
	add_child(level)
	level.position.x = 0
	level.position.y = 0

	
# Called when the node enters the scene tree for the first time.
func _ready():
	$"GUI/Pause Menu".hide()
	$"GUI/PauseMenuBackground".hide()
	$MainTheme.play()
	$"GUI/Pause Menu/Volume Sliders/Master Volume".value = 0
	AudioServer.set_bus_layout(load("res://default_bus_layout.tres"))
	AudioServer.set_bus_volume_db(0,-20)
	_change_level(Globalvars.getLevel())
	coinCounter = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

#When pause button is pressed 
func _on_pause_button_pressed():
	get_tree().paused = true
	$"GUI/Pause Menu".show()
	$GUI/PauseButton.hide()
	$GUI/PauseMenuBackground.show()


#Called when any change is made to volume slider
func _on_master_volume_value_changed(value):

	AudioServer.set_bus_volume_db(0,value)
	if value == -20:
		AudioServer.set_bus_mute(0, true)
	else :
		AudioServer.set_bus_mute(0,false)



#Called when back button in pause menu is pressed
func _on_back_button_pressed():
	get_tree().paused = false
	$GUI/PauseButton.show()
	$"GUI/Pause Menu".hide()
	$GUI/PauseMenuBackground.hide()

#Called when Menu button is pressed in pause menu
func _on_menu_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://MainMenu/MainMenu.tscn")
	
#Called when restart button is pressed in pause menu
func _on_restart_button_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false
	_change_level(Globalvars.getLevel())



#Adds one to coin counter
func _add_coin():
	coinCounter += 1

#returns counterCounter float
func _get_coin_counter():
	return coinCounter

#sets coinCounter to parameter
func _set_counter(set_to):
	coinCounter = set_to
