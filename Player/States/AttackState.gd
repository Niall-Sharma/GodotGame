extends State

class_name PlayerAttackState

@export var attackTime : float = .3
@export var attackTimer : Timer
@export var knockback_amount : Vector2
@export var playerSprite : Sprite2D
@export var attackHitbox : Area2D
var bodiesInAttack
var playerDamageDealing = 1#get_parent()._get_penis_blast()

#func ready():
#	playerDamageDealing = 1

func onEnter():
	animationState.travel("Attack")
	attackTimer.wait_time = attackTime
	attackTimer.start()
	bodiesInAttack = attackHitbox.get_overlapping_bodies()
	for body in bodiesInAttack:
		if "enemy" in body.name:
			body.takeDamage(playerDamageDealing)

func onExit():
	attackTimer.stop()
	animationState.travel("Start")


func _on_attack_timer_timeout():
	nextState = get_parent().states[1]

func _add_damage(dmg):
	playerDamageDealing += dmg

func _get_damage():
	return playerDamageDealing


func _on_player_property_list_changed():
	_add_damage(5)
	print("IT SHOULD DO MORE DMG NOWWWW")
	print(playerDamageDealing)
