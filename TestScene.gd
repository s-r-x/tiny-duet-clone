extends Node

onready var player = $Player
func _ready():
	player.remove_overlay()
	#player.apply_gravity(0.5);
	player.start_infinite_rotation()
	player.controlled = true
	player.apply_play_ready_styles()
	player.enable_trail()
