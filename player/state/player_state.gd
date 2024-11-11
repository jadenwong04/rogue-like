class_name PlayerState
extends State

@onready var player_node: CharacterBody2D = get_parent().get_parent()
@onready var animation_node: AnimatedSprite2D = player_node.get_node("AnimatedSprite2D")

enum PLAYER_STATE { IDLE, MOVE }
const PLAYER_STATE_STRING = [ "idle", "move" ]

func enter():
	animation_node.play()

func exit():
	animation_node.stop()
