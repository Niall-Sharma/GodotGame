extends State

class_name GroundState

@export var JUMP_VELOCITY : float = -400.0
@export var jumpSoundEffect : AudioStreamPlayer

var airTime = 0.0
@export var airTimeBuffer : float
func state_input(_event : InputEvent):
	if(_event.is_action_pressed("jump") and airTime < airTimeBuffer):
		character.velocity.y = JUMP_VELOCITY
		nextState = get_parent().states[0]
		jumpSoundEffect.play()
	if(_event.is_action_pressed("attack")):
		nextState = get_parent().states[3]

func onEnter():
	pass
	
func stateProcess(_delta):
	airTime += _delta
	if(character.is_on_floor()):
		airTime = 0
	
	if(!character.is_on_floor() and airTime>=airTimeBuffer):
		nextState = get_parent().states[0]
	
	if(!character.is_on_floor()):
		character.velocity.y += GRAVITY * _delta

