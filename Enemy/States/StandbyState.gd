extends State

class_name StandbyState

@export var RayCastForward: RayCast2D
@export var RayCastDiagonal: RayCast2D
@export var FOLLOW_STATE : State
@export var FOLLOW_DISTANCE : float = 200
@onready var Player : CharacterBody2D = $"../../../Player"
func stateProcess(_delta):
	#if RayCastForward.is_colliding():
		#if RayCastForward.get_collider().name == "Player":
		#	nextState = FOLLOW_STATE
	
	#if RayCastDiagonal.is_colliding():
	#	if RayCastDiagonal.get_collider().name == "Player":
	#		nextState = FOLLOW_STATE
	if(abs(character.global_position.x- Player.global_position.x) < FOLLOW_DISTANCE):
		nextState = FOLLOW_STATE
	
func onEnter():
	animationState.travel("Idle")
