extends PlayerState

class_name GroundState

@export var JUMP_VELOCITY : float = -400.0
@export var AIR_STATE : PlayerState
@export var landSoundEffect : AudioStreamPlayer
@export var jumpSoundEffect : AudioStreamPlayer


func state_input(event : InputEvent):
	if(event.is_action_pressed("jump")):
		character.velocity.y = JUMP_VELOCITY
		nextState = AIR_STATE
		jumpSoundEffect.play()

func onEnter():
	landSoundEffect.play()
	
func stateProcess(_delta):
	if(!character.is_on_floor()):
		nextState=AIR_STATE
