extends Control

@onready var winner_label: Label = $Panel/VBoxContainer/WinnerLabel

func _ready() -> void:
	$Panel/VBoxContainer/HBoxContainer/RestartButton.connect("pressed", Callable(self, "_on_restart_button_pressed"))
	$Panel/VBoxContainer/HBoxContainer/QuitButton.connect("pressed", Callable(self, "_on_quit_button_pressed"))
	winner_label.text = "Player 1" if GameManager.player1_score > GameManager.player2_score else "Player 2" + " Wins!"

func _on_restart_button_pressed():
	GameManager.start_game(GameManager.game_mode)
	hide()

func _on_quit_button_pressed():
	GameManager.main_node.ui.get_node("MainMenu").show()
	hide()
