extends PlayerState

class_name HurtState

@export var stateDuration : float = 0.5
@export var hurtSound : AudioStreamPlayer

func onEnter():
	hurtSound.play()
	$HurtTimer.wait_time = stateDuration
	$HurtTimer.start()
	
func onExit():
	$HurtTimer.stop()


func _on_hurt_timer_timeout():
	nextState = get_parent().states[1]
