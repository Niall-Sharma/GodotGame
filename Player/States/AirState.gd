extends PlayerState

class_name AirState

@export var GROUND_STATE : PlayerState

func stateProcess(_delta):
	if(character.is_on_floor()):
		nextState = GROUND_STATE
	
	
func onEnter():
	animationTree.set("parameters/conditions/inAir", true)
	
func onExit():
	animationTree.set("parameters/conditions/inAir", false)	
