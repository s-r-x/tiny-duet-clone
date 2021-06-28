extends Node

func _on_CreditsTimer_timeout():
	$Theme.play()
	$InitAnimation.play("Anim")
func play():
	$PlayBtn.queue_free()
	$Player/Overlay.queue_free()
	$Title.queue_free()
	var player = $Player
	player.stop_rotation()
	yield(player, "ready_to_play")
	player.controlled = true;
