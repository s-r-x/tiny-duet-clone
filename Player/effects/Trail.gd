extends Line2D

onready var parent = get_parent()
export var gravity_scale: float = 0.5
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
	global_position = Vector2(0,0)
	var pos = parent.global_position
	if(gravity_scale == 0.0):
		add_point(Vector2(pos.x, pos.y))
	else:
		add_point(Vector2(pos.x, pos.y + -10))
		var size = get_point_count()
		for idx in range(size):
			if(idx == 0):
				continue
			var p = points[idx]
			points[idx] = Vector2(p.x, p.y + idx * gravity_scale)
	if(get_point_count() >= MAX_POINTS):
		remove_point(0)

