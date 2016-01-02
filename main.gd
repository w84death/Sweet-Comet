
extends Control


const STATE_INTRO = 2
const STATE_GAME = 4
const STATE_GAMEOVER = 8
const STATE_HIGHSCORE = 16

var game_state = STATE_INTRO
var comet_scene = preload('res://entities/comet.xscn')
var enemy_scene = preload('res://entities/enemy.xscn')
var comet
var enemies = []
var gui
var game_layer
var space_layer
var score_label
var speed_label

var score=0
var speed=4

func start_game():
	self.gui.get_node("title").hide()
	self.gui.get_node("game").show()
	self.game_layer.show()
	self.comet = self.comet_scene.instance()
	self.game_layer.add_child(self.comet)
	self.set_game_speed(1)
	self.game_state = STATE_GAME

func spawn_enemy():
	var enemy = self.enemy_scene.instance()
	self.game_layer.add_child(enemy)
	self.enemies.append(enemy)

func set_game_speed(speed_diff):
	self.speed += speed_diff
	self.space_layer.set_speed(self.speed)
	self.speed_label.set_text(str(self.speed*1000).pad_zeros(6))

func refresh_score():
	self.score_label.set_text(str(self.score).pad_zeros(12))

func _input(ev):
	if (game_state == STATE_INTRO and ev.type == InputEvent.MOUSE_BUTTON):
		self.start_game()

	if (game_state == STATE_GAME):
		if(ev.type==InputEvent.MOUSE_MOTION):
			self.comet.set_pos(ev.pos)
		if(ev.type==InputEvent.MOUSE_BUTTON):
			#self.set_game_speed(0.25)
			self.spawn_enemy()


func _ready():
	self.game_layer = self.get_node("game")
	self.space_layer = self.get_node("space")
	self.gui = self.get_node("GUI")
	self.score_label = self.gui.get_node("game/score")
	self.speed_label = self.gui.get_node("game/speed")
	
	set_process_input(true)
	set_process(true)
	pass
	
func _process(delta):
	if (game_state == STATE_GAME):
		self.score += 1
		self.refresh_score()
	return

