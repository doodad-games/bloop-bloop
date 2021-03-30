extends Node2D
class_name Map

export (PackedScene) var ShotBall

func _ready() -> void:
	var _nop := $Shooter.connect("shoot", self, "on_Shooter_shoot")

func on_Shooter_shoot(ball: Ball, target: Vector2) -> void:
	var shot: ShotBall = ShotBall.instance()
	add_child(shot)
	shot.init(ball, target)
