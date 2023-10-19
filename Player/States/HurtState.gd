extends State

class_name HurtState

@export var stateDuration : float = 0.5
@export var hurtSound : AudioStreamPlayer
@export var knockback_amount : Vector2
@export var playerSprite : Sprite2D

func onEnter():
	hurtSound.play()
	$HurtTimer.wait_time = stateDuration
	$HurtTimer.start()
	animationState.travel("Hurt")
	if playerSprite.flip_h == true:
		character.velocity+= knockback_amount
	else:
		character.velocity.x += -knockback_amount.x
		character.velocity.y += knockback_amount.y
	character.move_and_slide()
	
	
	
func onExit():
	$HurtTimer.stop()
	animationState.travel("Start")


func _on_hurt_timer_timeout():
	nextState = get_parent().states[1]
