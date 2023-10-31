extends State

class_name PlayerAttackState

@export var attackTime : float = .3
@export var attackTimer : Timer
@export var knockback_amount : Vector2
@export var playerSprite : Sprite2D
@export var attackHitbox : Area2D
var bodiesInAttack
var attackDmg = 1

func onEnter():
	animationState.travel("Attack")
	attackTimer.wait_time = attackTime
	attackTimer.start()
	bodiesInAttack = attackHitbox.get_overlapping_bodies()
	for body in bodiesInAttack:
		if "enemy" in body.name:
			body.takeDamage(attackDmg)

func onExit():
	attackTimer.stop()
	animationState.travel("Start")


func _on_attack_timer_timeout():
	nextState = get_parent().states[1]

func _add_Dmg():
	attackDmg += 1
