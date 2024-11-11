class_name Weapon
extends Item

var damage: int

func _init(offset_x: int, offset_y: int, equipped_image_path: String) -> void:
	super(offset_x, offset_y, equipped_image_path)
