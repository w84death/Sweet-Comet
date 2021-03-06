
extends Node2D

var particle
var screen_size
var speed = 100

func restart_position():
	self.set_pos(Vector2(-10, rand_range(32, self.screen_size.y-32)))
	self.speed = rand_range(50, 200)
	
func warp():
	var size = 1 + self.get_pos().x / 500
	self.particle.set_param(11, size)

func _ready():
	self.screen_size = get_viewport_rect().size
	self.particle = self.get_node("body")
	self.restart_position()
	set_process(true)
	pass

func _process(delta):
	var pos = self.get_pos()
	var new_pos = Vector2(pos.x, pos.y)
	new_pos.x += self.speed * delta
	if new_pos.x > self.screen_size.x + 32:
		self.restart_position()
	else:
		self.set_pos(new_pos)
		self.warp()

