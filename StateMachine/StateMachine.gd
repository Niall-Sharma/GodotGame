extends Node

class_name StateMachine

@export var character: CharacterBody2D
var states : Array[State]
@export var currentState : State
@export var animation_tree : AnimationTree

func _ready():
	for child in get_children():
		if child is State:
			states.append(child)
			child.character = character
			child.animationTree = animation_tree
			child.animationState = animation_tree["parameters/playback"]
		else:
			push_warning("Child " + child.name + " Is Not A State")
			
func _physics_process(_delta):
	if(currentState.nextState != null):
		switchState(currentState.nextState)
	if(currentState != null):
		currentState.stateProcess(_delta)
		
func checkCanMove():
	return currentState.canMove

func checkIsVulnerable():
	return currentState.isVulnerable

func switchState(nextState : State):
	if(currentState != null):
		currentState.onExit()
		currentState.nextState = null
		
	currentState = nextState
	
	currentState.onEnter()
	
func changeNextState(state : State):
	currentState.nextState = state

func _input(event : InputEvent):
	currentState.state_input(event)
