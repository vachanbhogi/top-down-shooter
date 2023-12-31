extends Camera2D

@export var shake_strength : float

@onready var timer := $Timer

func _ready() -> void:
	limit_top = $tl_limit.global_position.y
	limit_left = $tl_limit.global_position.x
	limit_bottom = $dr_limit.global_position.y
	limit_right = $dr_limit.global_position.x
	
	
func _shake(strength):
	var c_offset : Vector2 = lerp(
		get_offset(),
		Vector2(
			randf_range(-strength, strength),
			randf_range(-strength, strength)
		),
		shake_strength
	)
	set_offset(c_offset)
	
