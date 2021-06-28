extends Line2D

onready var parent = get_parent()
var is_enabled = false
const MAX_POINTS = 25
func _ready():
	set_as_toplevel(true)
	self.modulate.a = 0.225

func enable():
	is_enabled = true
	
func _process(_delta):
	if !is_enabled:
		return
	global_position = 	Vector2(0,0)
	add_point(parent.global_position)
	if(self.points.size() >= MAX_POINTS):
		remove_point(0)


