extends Node2D

@export var bullet : PackedScene

var shooting := false
var can_shoot := true

@onready var cam : Camera2D
@onready var shooting_timer := $Shooting
@onready var cooldown_timer := $Cooldown

func _process(_delta) -> void:
	if not cam:
		cam = get_parent().cam
		
	if Input.is_action_just_pressed("shoot") and can_shoot:
		shooting = true
		shooting_timer.start()
			
	if shooting:
		_shoot()
		cam._shake(0)

func _shoot() -> void:
	var i = bullet.instantiate()
	i.global_rotation = global_rotation
	i.global_position = global_position
	get_tree().root.add_child(i)
	cam._shake(20)


func _on_shooting_timeout() -> void:
	shooting = false
	can_shoot = false
	cooldown_timer.start()

func _on_cooldown_timeout() -> void:
	can_shoot = true
