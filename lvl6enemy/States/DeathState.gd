extends State


func onEnter():
	animationState.travel("death")
	await(get_tree().create_timer(1.5).timeout)
	get_tree().queue_delete(get_parent().get_parent())

