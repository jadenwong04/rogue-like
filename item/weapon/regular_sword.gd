class_name RegularSword
extends Weapon

const OFFSET_X: int = 0
const OFFSET_Y: int = -7
const EQUIPPED_IMAGE_PATH: String = "res://asset/frames/weapon_regular_sword.png"

func _init():
	super(OFFSET_X, OFFSET_Y, EQUIPPED_IMAGE_PATH)
