extends State

class_name PlayerAttackState

@export var attackTime : float = .3
@export var attackTimer : Timer

func onEnter():
	animationState.travel("Attack")
	attackTimer.wait_time = attackTime
	attackTimer.start()

func onExit():
	attackTimer.stop()
	animationState.travel("Start")


func _on_attack_timer_timeout():
	nextState = get_parent().states[1]
