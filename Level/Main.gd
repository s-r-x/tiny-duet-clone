extends Node

var RestBrickEnemy = preload("res://enemies/RestBrick.tscn")
func _ready():
	for point in $Positions.get_children():
		var enemy = RestBrickEnemy.instance()
		enemy.position = point.position
		add_child(enemy)
func _process(_delta):
	self.position.y += 5
