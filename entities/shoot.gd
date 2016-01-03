
extends Node2D

var particle
var screen_size
var speed = 300
var fire = false

func initialize(pos):
	self.set_pos(pos)
	self.fire = true
	
func off_screen():
	self.fire = false
	self.queue_free()

func warp():
	var size = 1 + self.get_pos().x / 500
	self.particle.set_param(11, size)

func _ready():
	self.screen_size = get_viewport_rect().size
	self.particle = self.get_node("body")
	set_process(true)
	pass

func _process(delta):
	var pos = self.get_pos()
	var new_pos = Vector2(pos.x, pos.y)
	if fire:
		new_pos.x -= self.speed * delta
		if new_pos.x < -128:
			self.off_screen()
		else:
			self.set_pos(new_pos)
			self.warp()
