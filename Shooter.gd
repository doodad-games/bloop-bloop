extends Polygon2D
class_name Shooter

signal shoot(pos, rot)

const QUEUED_BALL_TSCN := preload("res://QueuedBall.tscn")

var queue := []
var advancing := false

func _ready() -> void:
	for i in range(G.QUEUE_NUM_BALLS):
		create_ball(i)

func _input(event: InputEvent) -> void:
	if (
		advancing or \
		not event is InputEventMouseButton or \
		event.pressed != true
	):
		return
	
	var next: QueuedBall = queue.pop_front()
	next.queue_free()
	
	emit_signal("shoot", next.get_node("Ball"), event.position)
	
	for queued_ball in queue:
		queued_ball.advance()

	advancing = true
	yield(get_tree().create_timer(G.QUEUE_ADVANCE_TIME), "timeout")
	advancing = false
	
	create_ball(G.QUEUE_NUM_BALLS - 1)
	
func create_ball(queue_pos: int) -> void:
	var ball: QueuedBall = QUEUED_BALL_TSCN.instance()
	$QueuedBallPath.add_child(ball)
	ball.init(queue_pos)
	queue.push_back(ball)
