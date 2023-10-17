extends State

class_name GroundState

@export var JUMP_VELOCITY : float = -400.0
@export var jumpSoundEffect : AudioStreamPlayer


func state_input(_event : InputEvent):
	if(_event.is_action_pressed("jump")):
		character.velocity.y = JUMP_VELOCITY
		nextState = get_parent().states[0]
		jumpSoundEffect.play()
	if(_event.is_action_pressed("attack")):
		nextState = get_parent().states[3]

func onEnter():
	pass
	
func stateProcess(_delta):
	if(!character.is_on_floor()):
		nextState=get_parent().states[0]
