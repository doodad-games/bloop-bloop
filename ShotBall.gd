extends VisibilityNotifier2D
class_name ShotBall

var direction: Vector2

func _ready() -> void:
	var _nop := connect("screen_exited", self, "fly_offscreen")

func _physics_process(delta: float) -> void:
	update_position(delta)

func init(ball: Ball, target: Vector2) -> void:
	global_position = ball.global_position
	direction = (target - position).normalized()
	
	ball.get_parent().remove_child(ball)
	add_child(ball)

func update_position(delta: float) -> void:
	position += direction * G.SHOT_SPEED * delta

func fly_offscreen() -> void:
	queue_free()
