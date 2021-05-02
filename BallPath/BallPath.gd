extends Path2D
class_name BallPath

signal ball_spawned(inst)

const START_TSCN := preload("res://BallPath/Start.tscn")
const SEGMENT_TSCN := preload("res://BallPath/Segment.tscn")
const END_TSCN := preload("res://BallPath/End.tscn")
const ROLLING_BALL_TSCN := preload("res://RollingBall.tscn")

var graphic_ctnr: Node2D
var ball_spawn_period_elapsed := 0.0

func _ready() -> void:
	build_graphic()

func _physics_process(delta: float) -> void:
	maybe_spawn(delta)

func build_graphic() -> void:
	assert(get_curve().get_baked_length() > 0)
	
	graphic_ctnr = Node2D.new()
	graphic_ctnr.name = "Graphic"
	add_child(graphic_ctnr)
	
	var f := PathFollow2D.new()
	add_child(f)
	
	f.loop = false
	
	build_bit(START_TSCN, f)
	
	while true:
		f.offset += G.PATH_BUILD_STEP
		
		build_bit(SEGMENT_TSCN, f)
		
		if f.unit_offset == 1:
			break
	
	build_bit(END_TSCN, f)
	
	f.queue_free()

func build_bit(scene: PackedScene, follower: PathFollow2D) -> void:
	var node: Node = scene.instance()
	graphic_ctnr.add_child(node)
	
	node.position = follower.position
	node.rotation = follower.rotation

func maybe_spawn(delta: float) -> void:
	ball_spawn_period_elapsed += delta
	if ball_spawn_period_elapsed < G.BALL_SPAWN_PERIOD:
		return
	ball_spawn_period_elapsed -= G.BALL_SPAWN_PERIOD
	
	var ball: RollingBall = ROLLING_BALL_TSCN.instance()
	add_child(ball)
	ball.init()
	
	emit_signal("ball_spawned", ball)
