extends CanvasLayer

var button = preload("res://levelbutton.tscn")
var buttonvars = []
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(10): # Replace with function body.
		var butject = button.instantiate()
		get_child(0).add_child(butject)
		buttonvars.append(butject)
		butject.text = "Level " + str(i+1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
