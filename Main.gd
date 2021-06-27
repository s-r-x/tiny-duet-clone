extends Node

func _on_CreditsTimer_timeout():
	$Theme.play()
	$InitAnimation.play("Anim")
