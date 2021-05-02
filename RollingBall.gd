extends PathFollow2D
class_name RollingBall

signal reached_end()

var raw_offset := 0.0

const BALL_TSCN := preload("res://Ball.tscn")

func _physics_process(delta: float) -> void:
	roll(delta)

func init() -> void:
	var ball: Ball = BALL_TSCN.instance()
	add_child(ball)
	
	raw_offset = -G.BALL_RADIUS * 2
	
	roll(0.0)

func roll(delta: float) -> void:
	raw_offset += G.BALL_ROLL_SPEED * delta
	
	if raw_offset < 0:
		offset = 0
		$Ball.offset = Vector2.DOWN.rotated(rotation) * raw_offset
		$Ball.color.a = clamp(1 - raw_offset / (-G.BALL_RADIUS * 2), 0.0, 1.0)
	else:
		offset = raw_offset
		$Ball.offset = Vector2.ZERO
		$Ball.color.a = 1.0
	
	if unit_offset >= 1.0:
		emit_signal("reached_end")
