extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.position.x = get_parent().get_node("Player").position.x
	self.position.y = get_parent().get_node("Player").position.y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	self.position.x = get_parent().get_node("Player").get_child(5).get_screen_center_position().x
	
	self.position.y = get_parent().get_node("Player").get_child(5).get_screen_center_position().y

