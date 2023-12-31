extends GPUParticles2D

func _process(delta: float) -> void:
	modulate.a -= delta
