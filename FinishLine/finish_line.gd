extends Node2D

signal player_reached_finish


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_area_2d_body_entered(_body):
	get_tree().change_scene_to_file("res://levelselect/level_select.tscn")
	Globalvars.addlevel(Globalvars.getLevel()+1)
	emit_signal("player_reached_finish")
	
