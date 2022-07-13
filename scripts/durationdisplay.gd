extends Control


var duration: float = 1.00


func _process(_delta: float) -> void:
	$DurationBar.set_size(Vector2(size.x * duration, 20))
