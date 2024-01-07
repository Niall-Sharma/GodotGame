extends Node2D
var testvar =  preload("res://Level1/level_1.tscn")

var levels = [preload("res://Level1/level_1.tscn"),preload("res://Level2/level_2.tscn"),preload("res://Level3/level_3.tscn"),preload("res://level 4/level4.tscn"),null,preload("res://Level6/level_6.tscn"),null,null,null,null,null,preload("res://Infinite/ran.tscn")]

var infiniteLevel = preload("res://Infinite/ran.tscn")
var coinCounter
var infoExchangeLevelNum #holds onto the level num when it's changed so that other funcs can use it

var currentLevel 
var playerInLevel 

func _change_level(x):
	var level = levels[x].instantiate()
	add_child(level)
	level.position.x = 0
	level.position.y = 0
	infoExchangeLevelNum = x

	
# Called when the node enters the scene tree for the first time.
func _ready():
	$"GUI/Pause Menu".hide()
	$"GUI/PauseMenuBackground".hide()
	$ShopGUI/ShopMenuBackground.hide()
	$"ShopGUI/Shop Menu".hide()
	$MainTheme.play()
	$"GUI/Pause Menu/Volume Sliders/Master Volume".value = 0
	AudioServer.set_bus_layout(load("res://default_bus_layout.tres"))
	AudioServer.set_bus_volume_db(0,-20)
	_change_level(Globalvars.getLevel())
	coinCounter = 0
	currentLevel = levels[infoExchangeLevelNum].instantiate()
	playerInLevel = currentLevel.get_node("Player")

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


func _on_restart_button_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false
	_change_level(Globalvars.getLevel())


func _add_coin():
	coinCounter += 1
	$PickupSound.play()
	
	
func _get_coin_counter():
	return coinCounter

func _set_counter(set_to):
	coinCounter = set_to


func _on_shop_button_pressed():
	get_tree().paused = true
	$ShopGUI/ShopMenuBackground.show()
	$"ShopGUI/Shop Menu".show()


func _on_shop_back_button_pressed():
	$ShopGUI/ShopMenuBackground.hide()
	$"ShopGUI/Shop Menu".hide()
	get_tree().paused = false
	



func _get_player_from_master():
	return playerInLevel



func _on_test_button_pressed():
	print("gloop")
	if(coinCounter>= 1):
	#	var currentLevel = levels[infoExchangeLevelNum].instantiate()
	#	var playerInLevel = currentLevel.get_node("Player")
		get_tree().paused = false
		playerInLevel._ready()
		playerInLevel.dmgTrigger()
		get_tree().paused = true
		print("beans")
		coinCounter -= 1
	else:
		print("poop")
	#	var currentLevel = levels[infoExchangeLevelNum].instantiate()
	#	var playerInLevel = currentLevel.get_node("Player")
		
		print("beans")

