extends State

class_name PlayerAttackState

func onEnter():
	animationState.travel("Attack")

func onExit():
	pass


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Attack":
		nextState = get_parent().states[1]
