extends Control

@onready var player1_score_label = $MarginContainer/GridContainer/Player1Score
@onready var player2_score_label = $MarginContainer/GridContainer/Player2Score

func update_score(player1_score: int, player2_score: int):
	player1_score_label.text = str(player1_score)
	player2_score_label.text = str(player2_score)
