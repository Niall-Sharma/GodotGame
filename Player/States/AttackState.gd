extends State

class_name PlayerAttackState

@export var attackTime : float = .3
@export var attackTimer : Timer
@export var knockback_amount : Vector2
@export var playerSprite : Sprite2D
@export var attackHitbox : Area2D
var variable_damage  = 2
var bodiesInAttack

 

func _ready():
	pass
	#variable_damage =1
	
func _add_var_damage(ammount):
	variable_damage = variable_damage + ammount
	
func _get_var_damage():
	return variable_damage

func onEnter():
	animationState.travel("Attack")
	attackTimer.wait_time = attackTime
	attackTimer.start()
	var shouldBePlayer = get_parent().get_parent()
	bodiesInAttack = attackHitbox.get_overlapping_bodies()
	for body in bodiesInAttack:
		if "enemy" in body.name:
			print($/root/Master._get_player_from_master()._get_damage())
			body.takeDamage($/root/Master._get_player_from_master()._get_damage())
			#body.takeDamage(variable_damage) 
			#print(variable_damage)

func onExit():
	attackTimer.stop()
	animationState.travel("Start")


func _on_attack_timer_timeout():
	nextState = get_parent().states[1]




func _on_player_property_list_changed():
	_add_var_damage(1)
	print("IT SHOULD DO MORE DMG NOWWWW")
	print(variable_damage)
