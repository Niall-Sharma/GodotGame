extends CanvasLayer
# Called when the node enters the scene tree for the first time.
func _ready():
	$Options.visible = false
	$Main.visible = true
	$MenuTheme.play()



# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_options_button_pressed():
	$Options.visible = true
	$Main.visible = false
	



func _on_quit_button_pressed():
	get_tree().quit() 


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Master/master.tscn")



func _on_back_button_pressed():
	$Options.visible = false
	$Main.visible = true # Replace with function body.


func _on_master_volume_value_changed(value):
	AudioServer.set_bus_layout(load("res://default_bus_layout.tres"))
	AudioServer.set_bus_volume_db(0,value)
	if value == -20:
		AudioServer.set_bus_mute(0, true)
	else :
		AudioServer.set_bus_mute(0,false)








func _on_credit_button_pressed():
	get_tree().change_scene_to_file("res://CreditFolder/Credits.tscn")
