extends Node2D
class_name Map

const SHOT_BALL_TSCN := preload("res://ShotBall.tscn")

func _ready() -> void:
	var _nop := $Shooter.connect("shoot", self, "on_Shooter_shoot")
	_nop = $BallPath.connect("ball_spawned", self, "on_BallPath_ball_spawned")

func on_Shooter_shoot(ball: Ball, target: Vector2) -> void:
	var shot: ShotBall = SHOT_BALL_TSCN.instance()
	add_child(shot)
	shot.init(ball, target)

func on_BallPath_ball_spawned(ball: RollingBall) -> void:
	var _nop := ball.connect("reached_end", self, "on_RollingBall_reached_end")

func on_RollingBall_reached_end() -> void:
	Engine.time_scale = 0.0
