extends Polygon2D
class_name Ball

func _ready() -> void:
	color = G.BALL_COLOURS[randi() % len(G.BALL_COLOURS)]
