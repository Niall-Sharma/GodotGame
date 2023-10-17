extends State

class_name EnemyHurt

@onready var hurtTimer : Timer = $HurtTimer
@export var STANDBY_STATE : State

func _on_hurt_timer_timeout():
	nextState = STANDBY_STATE

func onEnter():
	hurtTimer.start()
	animationState.travel("Hurt")
	
func onExit():
	hurtTimer.stop()
