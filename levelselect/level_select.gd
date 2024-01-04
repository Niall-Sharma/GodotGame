extends CanvasLayer

var button = preload("res://LevelButton/levelbutton.tscn")
var infinitebutton = preload("res://Infinite/InfiniteButton.tscn")
var buttonvars = []
var butnums = []
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(6): # Replace with function body.
		var butject = button.instantiate()
		get_child(0).add_child(butject)
		buttonvars.append(butject)
		butject.text = "Level " + str(i+1)
		butject.name = "Level " + str(i+1) + " Button"
		butject.lvl_num = i
	var infi = infinitebutton.instantiate()
	
	get_child(0).add_child(infi)
	
	infi.text = "Infinite"
	infi.name = "InfiniteButton"
	infi.lvl_num = 7
	for buttonvar in buttonvars:
		buttonvar.enabled = Globalvars.getlc(buttonvar.lvl_num)


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://MainMenu/MainMenu.tscn")
