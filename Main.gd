extends Node

onready var player = $Player

var LevelScene = preload("res://Level/Main.tscn")

func _on_CreditsTimer_timeout():
	$Theme.play()
	$InitAnimation.play("Anim")
func play():
	$PlayBtn.queue_free()
	$Player/Overlay.queue_free()
	$Title.hide()
	player.stop_rotation()
	yield(player, "ready_to_play")
	player.controlled = true;
	player.apply_gravity(0.5)
	var level = LevelScene.instance();
	add_child(level)
