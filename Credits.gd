extends Control


func _on_CreditsAnimation_animation_finished(_anim):
	self.queue_free()
