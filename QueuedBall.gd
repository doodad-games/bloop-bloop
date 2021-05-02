extends PathFollow2D
class_name QueuedBall

var pos_in_queue := 0
var dest_offset := 0.0

func _physics_process(delta: float) -> void:
	update_position(delta)

func init(initial_pos: int) -> void:
	pos_in_queue = initial_pos
	calc_dest_offset()
	set_unit_offset(dest_offset)
	update_opacity()
	
func advance() -> void:
	assert(pos_in_queue > 0)
	pos_in_queue -= 1
	calc_dest_offset()

func calc_dest_offset() -> void:
	dest_offset = pos_in_queue / (G.QUEUE_NUM_BALLS - 1.0)

func update_position(delta: float) -> void:
	if unit_offset == dest_offset:
		return
	
	var offset := unit_offset
	offset -= G.QUEUE_ADVANCE_AMOUNT * delta
	offset = max(dest_offset, offset)
	
	set_unit_offset(offset)
	update_opacity()

func update_opacity() -> void:
	($Ball as Polygon2D).color.a = 1 - unit_offset
