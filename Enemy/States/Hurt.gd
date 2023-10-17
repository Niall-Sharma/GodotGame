extends State

class_name EnemyHurt

@onready var hurtTimer : Timer = $HurtTimer


func _on_hurt_timer_timeout():
	animationState.travel("Hurt")

func onEnter():
	hurtTimer.start()
	
func onExit():
	hurtTimer.stop()
