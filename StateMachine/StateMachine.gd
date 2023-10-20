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
	#Check if next state == a state
	if(currentState.nextState != null):
		switchState(currentState.nextState)
	#If currentState exists run the stateProcess from currentState every frame
	if(currentState != null):
		currentState.stateProcess(_delta)
	
#Returns canMove boolean from state
func checkCanMove():
	return currentState.canMove

#Returns isVulnerable boolean from state
func checkIsVulnerable():
	return currentState.isVulnerable

func checkCanAttack():
	return currentState.canAttack

#Takes a state as a parameter. Called whenever nextState != null
func switchState(nextState : State):
	#If currentState exists run currentState's onExit() then set it's nextState = null 
	if(currentState != null):
		currentState.onExit()
		currentState.nextState = null
	#set the currentState = to next state, then run the new currentStates onEnter function.
	currentState = nextState
	
	currentState.onEnter()

#Takes a state as a parameter. When called change currentState's nextState = to inputed state
func changeNextState(state : State):
	currentState.nextState = state

#Passes an input to the currentState's state_input() function.
func _input(event : InputEvent):
	currentState.state_input(event)
