extends State

class_name AirState

@export var landSoundEffect : AudioStreamPlayer
func stateProcess(_delta):
	if(character.is_on_floor()):
		nextState = get_parent().states[1]
		
func onEnter():
	animationTree.set("parameters/conditions/inAir", true)

	
func onExit():
	animationTree.set("parameters/conditions/inAir", false)	
	landSoundEffect.play()
