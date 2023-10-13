extends State


class_name EnemyAttackState

@export var STANDBY_STATE : State
@onready var attackTimer : Timer = $AttackTimer

func _on_attack_timer_timeout():
	nextState = STANDBY_STATE

func onEnter():
	attackTimer.start()
	animationState.travel("Attack")

func onExit():
	attackTimer.stop()
