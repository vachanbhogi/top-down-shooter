extends CharacterBody2D
class_name  Player

@onready var cam : Camera2D = $Camera2D

var speed : int = 250

func _ready() -> void:
	cam.set_as_top_level(true)

func _physics_process(_delta: float) -> void:
	set_velocity(Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	).normalized() * speed)
	
	look_at(get_global_mouse_position())
	
	cam.global_position = global_position
	
	move_and_slide()


func _on_hurtbox_body_entered(_body: Node2D) -> void:
	get_parent()._end_screen()
