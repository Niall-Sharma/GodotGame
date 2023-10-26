extends Node

class_name State

var character : CharacterBody2D
@export var canMove : bool = true
@export var isVulnerable : bool = true
@export var animationTree : AnimationTree

var nextState : State = null
var animationState : AnimationNodeStateMachinePlayback

#Default function for passing inputs into state
func state_input(_event):
	pass

#Called when state is entered
func onEnter():
	pass
	
#Called when state is exited
func onExit():
	pass

#Called every frame of state
func stateProcess(_delta):
	pass
