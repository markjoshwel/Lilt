extends Sprite2D


func _process(_delta: float) -> void:
	if texture:
		var new_scale = get_viewport().size.x / texture.get_size().x
		set_global_scale(Vector2(new_scale, new_scale) * 1.5)
