extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setup_player("res://player/class/marksman/marksman.gd")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setup_player(player_script: String) -> void:
	$Player.set_script(load(player_script))
	$Player.set_process(true)
	$Player.set_physics_process(true)
