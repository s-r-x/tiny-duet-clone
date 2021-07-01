extends Node2D

export var controlled: bool = false
export var rot_speed = 5
const PLAY_READY_SCALE = 0.04
signal ready_to_play

onready var duet = $Duet

func apply_gravity(grav_scale: float):
	$Duet/Red/Trail.gravity_scale = grav_scale
	$Duet/Blue/Trail.gravity_scale = grav_scale
func remove_blend():
	$Duet/Red.set_material(null)
	$Duet/Blue.set_material(null)

func start_infinite_rotation():
	$RestRotateAnimation.play("Anim")
func stop_rotation():
	$RestRotateAnimation.stop()
	var tween = $Tween
	var curr_rot = duet.rotation_degrees
	tween.interpolate_property(duet, 'rotation_degrees', curr_rot, 720, 1, Tween.TRANS_LINEAR)
	tween.interpolate_property(self, 'position:y', self.position.y, self.position.y + 210, 0.4, Tween.TRANS_LINEAR)
	tween.start()
	yield(tween,"tween_all_completed")
	duet.rotation_degrees = 0
	emit_signal("ready_to_play")
func enable_trail():
	$Duet/Blue/Trail.enable()
	$Duet/Red/Trail.enable()
func remove_overlay():
	$Overlay.queue_free()

func _process(delta):
	if !controlled:
		return
	if Input.is_action_pressed("ui_right"):
		duet.rotation_degrees += rot_speed
	if Input.is_action_pressed("ui_left"):
		duet.rotation_degrees -= rot_speed

func apply_play_ready_styles():
	remove_blend()
	var blue = $Duet/Blue
	var red = $Duet/Red
	$Rail.modulate.a = 1
	blue.scale.x = PLAY_READY_SCALE
	blue.scale.y = PLAY_READY_SCALE
	red.scale.x = PLAY_READY_SCALE
	red.scale.y = PLAY_READY_SCALE
	blue.position.x = 125
	red.position.x = -125
	
