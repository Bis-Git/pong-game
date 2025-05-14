extends Node2D

@export var level: Control
@export var ui: Control
@export var ball: RigidBody2D

func _ready() -> void:
	(level.get_node("Player1Goal") as Area2D).connect("goal_scored", Callable(self, "_on_goal_scored"))
	(level.get_node("Player2Goal") as Area2D).connect("goal_scored", Callable(self, "_on_goal_scored"))

func reset_ball(scored_by: String):
	ball.position = Vector2(400, 300)
	var direction = Vector2(1, 0) if scored_by == "player2" else Vector2(-1, 0)
	ball.speed = 300
	ball.velocity = direction * 200

func _on_goal_scored(goal_name: String):
	SoundManager.goal_scored_sfx.play()
	if goal_name == "Player1Goal":
		GameManager.update_score("player2")
		reset_ball("player1")
	elif goal_name == "Player2Goal":
		GameManager.update_score("player1")
		reset_ball("player2")
	ui.update_score(GameManager.player1_score, GameManager.player2_score)
