extends Node

onready var tween = $Tween
onready var label = $Label
const VISIBLE_Y_POS = 20
const HIDDEN_Y_POS = -160
func show():
	tween.interpolate_property($Label, 'rect_position:y', label.rect_position.y, VISIBLE_Y_POS, .75, Tween.EASE_IN_OUT)
	tween.start()
func hide():
	tween.interpolate_property($Label, 'rect_position:y', label.rect_position.y, HIDDEN_Y_POS, 0.5, Tween.EASE_IN_OUT)
	tween.start()
