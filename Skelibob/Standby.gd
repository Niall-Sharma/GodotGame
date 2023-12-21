extends State


@export var FOLLOW_STATE : State
@export var FOLLOW_DISTANCE : float = 200
@onready var Player : CharacterBody2D = $"../../../Player"
func stateProcess(_delta):
	if(abs(character.global_position.x- Player.global_position.x) < FOLLOW_DISTANCE):
		nextState = FOLLOW_STATE
	
func onEnter():
	animationState.travel("Idle")
