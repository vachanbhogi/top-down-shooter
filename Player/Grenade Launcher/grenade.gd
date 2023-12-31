extends Area2D

@export var explosion : PackedScene

@onready var cam : Camera2D

func _ready() -> void:
	var i = explosion.instantiate()
	get_parent().add_child(i)
	i.global_position = global_position

func _process(_delta: float) -> void:
	cam._shake(70)

func _on_body_entered(body: Node2D) -> void:
	body._death()
