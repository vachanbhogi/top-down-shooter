extends Node2D

@export var grenade : PackedScene

var reloaded := true

@onready var cam : Camera2D
@onready var cooldown := $Cooldown
@onready var audio := $AudioStreamPlayer2D

func _process(_delta: float) -> void:
	if not cam:
		cam = get_parent().cam
		
	if Input.is_action_just_pressed("throw_grenade"):
		if reloaded:
			_throw_grenade(get_global_mouse_position())
		else:
			audio.play(0)

func _throw_grenade(pos : Vector2) -> void:
	var i = grenade.instantiate()
	i.cam = cam
	i.global_position = pos
	get_tree().root.add_child(i)
	cooldown.start()
	reloaded = false


func _on_cooldown_timeout() -> void:
	reloaded = true
