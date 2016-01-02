
extends Node2D

var particle
var collision

func warp():
	var size = 1 + self.get_pos().x / 500
	self.particle.set_param(11, size)
	print(size)

func _ready():
	self.particle = self.get_node("particle")
	self.collision = self.get_node("collision")
	set_process(true)
	pass


func _process(delta):
	self.warp()
	print(self.get_pos().x)
	return
