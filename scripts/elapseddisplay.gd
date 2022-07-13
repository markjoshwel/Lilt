extends Label

var duration: int = 260
var elapsed: int = 110


func _process(_delta: float) -> void:
	text = str(
		round(
			100 * (float(elapsed) / float(duration))
		)
	) + "%"
