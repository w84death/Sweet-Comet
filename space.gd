
extends Control

var stars = [null,null,null]

func set_speed(speed):
	self.stars[0].set_time_scale(speed)
	self.stars[1].set_time_scale(speed)
	self.stars[2].set_time_scale(speed)

func _ready():
	self.stars[0] = self.get_node("1")
	self.stars[1] = self.get_node("2")
	self.stars[2] = self.get_node("3")
	pass


