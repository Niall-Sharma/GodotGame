extends Label

@export var stateMachine : StateMachine
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "State: " + stateMachine.currentState.name
