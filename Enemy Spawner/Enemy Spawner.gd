extends Node

@export var enemy : PackedScene

var time := 0.5

@onready var point = $Path2D/PathFollow2D
@onready var timer := $Timer
@onready var player : Player = get_parent().player

func _ready():
	randomize()

func _process(delta: float) -> void:
	if time > 0.25:
		time -= delta * delta *  0.08

func _on_timer_timeout() -> void:
	var random = RandomNumberGenerator.new()
	var position = random.randf()
	point.set_progress_ratio(position)
	
	if not player:
		player = get_parent().player
	while point.global_position.distance_to(player.global_position) < 500:
		position = random.randf()
		point.set_progress_ratio(position)
		
	var i = enemy.instantiate()
	i.global_position = point.global_position
	get_parent().add_child(i)
	get_parent()._add_sig(i)
	
	timer.start(time)
