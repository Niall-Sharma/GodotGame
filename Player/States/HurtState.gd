extends PlayerState

class_name HurtState

@export var stateDuration : float = 0.5
@export var hurtSound : AudioStreamPlayer
var animationPlayback : AnimationNodeStateMachinePlayback
func onEnter():
	hurtSound.play()
	$HurtTimer.wait_time = stateDuration
	$HurtTimer.start()
	animationPlayback = animationTree["parameters/playback"]
	animationPlayback.travel("Hurt")
	
	
func onExit():
	$HurtTimer.stop()
	animationPlayback.travel("Start")


func _on_hurt_timer_timeout():
	nextState = get_parent().states[1]
