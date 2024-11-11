class_name RegularAxe
extends Weapon

const OFFSET_X: int = 2
const OFFSET_Y: int = -4
const EQUIPPED_IMAGE_PATH: String = "res://asset/frames/weapon_axe.png"

func _init():
	super(OFFSET_X, OFFSET_Y, EQUIPPED_IMAGE_PATH)
