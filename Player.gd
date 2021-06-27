extends Node2D

var controlled: bool = true
export var rot_speed = 0.1

func remove_blend():
	$Duet/Red.set_material(null)
	$Duet/Blue.set_material(null)

func stop_rotation():
	$RestRotateAnimation.stop()
	var tween = $Tween
	var duet = $Duet
	var curr_rot = duet.rotation_degrees
	tween.interpolate_property(duet, 'rotation_degrees', curr_rot, 360, 0.5, Tween.TRANS_LINEAR)
	tween.start()
	yield(tween, "tween_completed")
	duet.rotation_degrees = 0

func _process(_delta):
	if controlled:
		if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_up"):
			rotation += rot_speed
		if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_down"):
			rotation -= rot_speed
