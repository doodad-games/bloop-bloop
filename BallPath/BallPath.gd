extends Path2D
class_name BallPath

export (PackedScene) var BallPathStart
export (PackedScene) var BallPathSegment
export (PackedScene) var BallPathEnd

func _ready() -> void:
	build_graphic()

func build_graphic() -> void:
	assert(get_curve().get_baked_length() > 0)
	
	var f := PathFollow2D.new()
	add_child(f)
	
	f.loop = false
	
	build_bit(BallPathStart, f)
	
	while true:
		f.offset += G.PATH_BUILD_STEP
		
		build_bit(BallPathSegment, f)
		
		if f.unit_offset == 1:
			break
	
	build_bit(BallPathEnd, f)

func build_bit(scene: PackedScene, follower: PathFollow2D) -> void:
	var node: Node = scene.instance()
	add_child(node)
	
	node.position = follower.position
	node.rotation = follower.rotation
