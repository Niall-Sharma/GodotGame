extends State


@onready var hurtTimer : Timer = $HurtTimer
@export var STANDBY_STATE : State
@export var knockback_amount : Vector2
@export var enemySprite : Sprite2D

func _on_hurt_timer_timeout():
	nextState = STANDBY_STATE

func onEnter():
	hurtTimer.start()
	animationState.travel("Hurt")
	if enemySprite.flip_h == true:
		character.velocity+= knockback_amount
	else:
		character.velocity.x += -knockback_amount.x
		character.velocity.y += knockback_amount.y
	character.move_and_slide()
	
	
func onExit():
	hurtTimer.stop()
