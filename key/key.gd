extends StaticBody2D
@onready var level = $".."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		get_tree().queue_delete(self)
		if body.position.x > 1150 and body.position.y > 800:
			level.open_door(1) 
		if body.position.x <-1175 and body.position.x > -1250 and body.position.y < 55:
			level.open_door(2)

