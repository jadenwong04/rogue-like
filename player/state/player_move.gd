class_name PlayerMove
extends PlayerState

func physics_update(delta: float):
	animation_node.animation = player_node.get_animation_name(PLAYER_STATE.MOVE)
	if player_node.velocity.length() == 0:
		state_transition.emit(self, PLAYER_STATE_STRING[PLAYER_STATE.IDLE])
