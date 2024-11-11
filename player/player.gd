class_name Player
extends CharacterBody2D

const ITEM_POSITION_X = 10
const ITEM_POSITION_Y = 0

var item_node: Node2D
var player_state_script: Script = preload("res://player/state/player_state.gd")

#attributes
var character_class: String
var speed: int

func _init(_character_class, _hp, _speed) -> void:
	character_class = _character_class
	speed = _speed
	create_animation()
	item_node = get_node("Item")
	item_node.set_item_position_relative_to_holder(ITEM_POSITION_X, ITEM_POSITION_Y)

func _process(delta: float) -> void:
	view_direction()

func _physics_process(delta: float) -> void:
	#handle player movement
	velocity = get_movement()
	move_and_slide()
	
func view_direction() -> void:
	#player animation
	var view_direction = get_view_direction()
	if view_direction.x > 0:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true
	#equipped item
	item_node.rotation = view_direction.angle() 
	if view_direction.x < 0:
		item_node.scale.y = -1
	else:
		item_node.scale.y = 1

func get_view_direction() -> Vector2:
	return (get_global_mouse_position() - global_position).normalized()
	
func get_movement() -> Vector2:
	return get_movement_magnitude(get_movement_direction())

func get_movement_direction() -> Vector2:
	var d_velocity = Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		d_velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		d_velocity.y += 1
	if Input.is_action_pressed("move_right"):
		d_velocity.x += 1
	if Input.is_action_pressed("move_left"):
		d_velocity.x -= 1
	return d_velocity

func get_movement_magnitude(d_velocity: Vector2) -> Vector2:
	return d_velocity.normalized() * speed

func get_animation_name(state: int) -> String:
	return character_class + "_" + player_state_script.PLAYER_STATE_STRING[state]

func create_animation() -> void:
	var sprite_frames = SpriteFrames.new()
	for state in player_state_script.PLAYER_STATE.values():
		var animation_name = get_animation_name(state)
		var animation_frames = get_animation_frames("res://player/class/" + character_class + "/asset/" + player_state_script.PLAYER_STATE_STRING[state])
		sprite_frames.add_animation(animation_name)
		for frame in animation_frames:
			sprite_frames.add_frame(animation_name, frame)
	$AnimatedSprite2D.sprite_frames = sprite_frames

func get_animation_frames(path: String) -> Array:
	var dir = DirAccess.open(path)
	var loaded_frames = []
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		if (!file_name.ends_with(".import")):
			loaded_frames.append(load(path + "/" + file_name))
		file_name = dir.get_next()
	return loaded_frames
