class_name G

const BALL_COLOURS := [
	Color(0.7, 0.0, 0.0),
	Color(0.0, 0.7, 0.0),
	Color(0.0, 0.35, 0.7),
	Color(0.7, 0.7, 0.0),
]
const BALL_RADIUS := 48.0
const BALL_ROLL_SPEED := 48.0
const BALL_SPAWN_PERIOD := BALL_RADIUS / BALL_ROLL_SPEED

const PATH_BUILD_STEP := 16

const SHOT_SPEED := 1000

const QUEUE_NUM_BALLS := 3
const QUEUE_ADVANCE_TIME := 0.25
const QUEUE_ADVANCE_AMOUNT := (1.0 / (QUEUE_NUM_BALLS - 1)) / QUEUE_ADVANCE_TIME
