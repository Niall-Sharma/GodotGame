extends CanvasLayer

var button = preload("res://LevelButton/levelbutton.tscn")
var buttonvars = []
var butnums = []
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(10): # Replace with function body.
		var butject = button.instantiate()
		get_child(0).add_child(butject)
		buttonvars.append(butject)
		butnums.append(i+1)
		butject.text = "Level " + str(i+1)
		butject.name = "Level " + str(i+1) + " Button"
		butject.lvl_num = i

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass