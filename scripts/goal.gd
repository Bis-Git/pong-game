extends Area2D

signal goal_scored(player: String)

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.name == "Ball":
		emit_signal("goal_scored", name)
