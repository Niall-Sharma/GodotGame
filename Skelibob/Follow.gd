extends State


@export var STANDBY_STATE : State
@export var FOLLOW_DISTANCE : float = 200
@onready var Player : CharacterBody2D = $"../../../Player"

func onEnter():
	animationState.travel("Idle")

func stateProcess(_delta):
	if(abs(character.global_position.x- Player.global_position.x) > FOLLOW_DISTANCE):
		nextState = STANDBY_STATE
