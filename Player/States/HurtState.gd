extends State

class_name HurtState

@export var stateDuration : float = 0.5
@export var hurtSound : AudioStreamPlayer
@export var playerSprite : Sprite2D
var knockbackAmount : Vector2
func onEnter():
	hurtSound.play()
	$HurtTimer.wait_time = stateDuration
	$HurtTimer.start()
	animationState.travel("Hurt")
	if playerSprite.flip_h == true:
		character.velocity+= knockbackAmount
	else:
		character.velocity.x += -knockbackAmount.x
		character.velocity.y += knockbackAmount.y
	character.move_and_slide()
	
	
func onExit():
	$HurtTimer.stop()
	animationState.travel("Start")


func _on_hurt_timer_timeout():
	nextState = get_parent().states[1]
