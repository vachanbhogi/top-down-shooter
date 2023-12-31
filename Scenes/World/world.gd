extends Node2D

@export var endscreen : PackedScene

@onready var player : Player = $Player
@onready var anim := $UI/AnimationPlayer
@onready var scoreboard := $UI/Scoreboard

func _ready() -> void:
	_fade_in()

func _end_screen() -> void:
	_fade_out()
	get_tree().change_scene_to_packed(endscreen)

func _add_sig(i : Node):
	i.enemy_killed.connect(_enemy_killed)

func _enemy_killed():
	Global.score += 1
	scoreboard.text = "%04d" % Global.score

func _fade_in():
	anim.play("fade_in")
	get_tree().paused = false

func _fade_out():
	get_tree().paused = true
	anim.play("fade_out")
