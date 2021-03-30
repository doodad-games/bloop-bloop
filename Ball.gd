extends Polygon2D
class_name Ball

const COLOURS := [Color(0.7, 0, 0), Color(0, 0.7, 0), Color(0, 0, 0.7)]

func _ready() -> void:
	color = COLOURS[randi() % len(COLOURS)]
