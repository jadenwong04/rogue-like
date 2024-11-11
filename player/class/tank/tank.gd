class_name Tank
extends Player

const CHARACTER_CLASS = "tank"
const HP = 150
const SPEED = 60
const BASE_DAMAGE = 20

func _init():
	super(CHARACTER_CLASS, HP, SPEED)
