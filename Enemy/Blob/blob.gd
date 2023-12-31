extends CharacterBody2D

signal enemy_killed

@export var speed : int = 150
@export var death_effect : PackedScene

@onready var world : Node2D = get_parent()
@onready var player : Player = world.player

func _ready() -> void:
	player = get_parent().player

func _process(_delta: float) -> void:
	if player:
		var direction = player.position - position
		direction = direction.normalized()
		set_velocity(
			direction * speed
		)
	move_and_slide()

func _death() -> void:
	enemy_killed.emit()
	var i = death_effect.instantiate()
	get_parent().add_child(i)
	i.global_position = global_position
	queue_free()

func _on_hitbox_body_entered(_body: Node2D) -> void:
	_death()
