extends CharacterBody2D

const SPEED := 2500

@onready var timer := $Timer

func _process(_delta: float) -> void:
	set_velocity(
		Vector2.RIGHT.rotated(global_rotation) * SPEED
	)
	
	var collided = move_and_slide()
	if collided:
		timer.start(0.005)

func _on_timer_timeout() -> void:
	queue_free()
