extends Node2D

export var controlled: bool = false
export var moving: bool = false
export var rot_speed = 5
signal ready_to_play

onready var duet = $Duet
func remove_blend():
	$Duet/Red.set_material(null)
	$Duet/Blue.set_material(null)

func stop_rotation():
	$RestRotateAnimation.stop()
	var tween = $Tween
	var curr_rot = duet.rotation_degrees
	tween.interpolate_property(duet, 'rotation_degrees', curr_rot, 720, 1, Tween.TRANS_LINEAR)
	tween.interpolate_property(self, 'position:y', self.position.y, self.position.y + 175, 0.4, Tween.TRANS_LINEAR)
	#tween.interpolate_property(self, 'scale:y', self.scale.y, 0.7, 0.4, Tween.TRANS_LINEAR)
	#tween.interpolate_property(self, 'scale:x', self.scale.x, 0.7, 0.4, Tween.TRANS_LINEAR)
	tween.start()
	yield(tween,"tween_all_completed")
	duet.rotation_degrees = 0
	emit_signal("ready_to_play")


func _process(delta):
	if moving:
		position.y = position.y - 5
	if !controlled:
		return
	if Input.is_action_pressed("ui_right"):
		duet.rotation_degrees += rot_speed
	if Input.is_action_pressed("ui_left"):
		duet.rotation_degrees -= rot_speed
