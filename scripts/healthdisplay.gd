extends Control


@export var health: int = 100


func _process(_delta: float) -> void:
	$HealthBar.set_size(Vector2(size.x * (float(health) / 100), 0))
