extends Control

func _ready() -> void:
	$"Panel/HBoxContainer/VBoxContainer/1PlayerButton".connect("pressed", Callable(self, "_on_one_player_pressed"))
	$"Panel/HBoxContainer/VBoxContainer/2PlayerButton".connect("pressed", Callable(self, "_on_two_player_pressed"))

func _on_one_player_pressed():
	GameManager.start_game("1_player")
	hide()

func _on_two_player_pressed():
	GameManager.start_game("2_player")
	hide()
