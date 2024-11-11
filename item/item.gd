class_name Item
extends Node2D

var equipped_node: Sprite2D
var offset_x: int
var offset_y: int
var equipped_image_path: String

func _init(_offset_x: int, _offset_y: int, _equipped_image_path: String) -> void:
	offset_x = _offset_x
	offset_y = _offset_y
	equipped_image_path = _equipped_image_path

func _ready() -> void:
	equipped_node = get_node("Node2D/Equipped")
	equipped_node.offset.x = offset_x
	equipped_node.offset.y = offset_y
	equipped_node.texture = load(equipped_image_path)

func _process(delta: float) -> void:
	pass

func set_item_position_relative_to_holder(x: int, y: int):
	equipped_node.position.x = x
	equipped_node.position.y = y
