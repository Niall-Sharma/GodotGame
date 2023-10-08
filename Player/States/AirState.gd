extends PlayerState

class_name AirState

var canDoubleJump : bool = true
@export var DOUBLE_JUMP_VELOCITY : float = -400.0
@export var landSoundEffect : AudioStreamPlayer
func stateProcess(_delta):
	if(character.is_on_floor()):
		nextState = get_parent().states[1]
	
func state_input(event):
	if(event.is_action_pressed("jump") && canDoubleJump):
		character.velocity.y = DOUBLE_JUMP_VELOCITY
		canDoubleJump = false
		
func onEnter():
	animationTree.set("parameters/conditions/inAir", true)
	canDoubleJump = true
	
func onExit():
	animationTree.set("parameters/conditions/inAir", false)	
	landSoundEffect.play()
