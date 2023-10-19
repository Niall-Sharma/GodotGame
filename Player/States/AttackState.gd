extends State

class_name PlayerAttackState

@export var attackTime : float = .3
@export var attackTimer : Timer
@export var knockback_amount : Vector2
@export var playerSprite : Sprite2D

func onEnter():
	animationState.travel("Attack")
	attackTimer.wait_time = attackTime
	attackTimer.start()
	if playerSprite.flip_h == true:
		character.velocity+= knockback_amount
	else:	
		character.velocity.x += -knockback_amount.x
		character.velocity.y += knockback_amount.y
	character.move_and_slide()
	

func onExit():
	attackTimer.stop()
	animationState.travel("Start")


func _on_attack_timer_timeout():
	nextState = get_parent().states[1]
