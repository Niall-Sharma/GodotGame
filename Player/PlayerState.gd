extends Node

class_name PlayerState

var character : CharacterBody2D
@export var canMove : bool = true
@export var isVulnerable : bool = true
@export var animationTree : AnimationTree

var nextState : PlayerState = null

func state_input(event):
	pass

func onEnter():
	pass
	
func onExit():
	pass

func stateProcess(_delta):
	pass
