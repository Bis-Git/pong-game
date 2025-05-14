extends Node2D

@onready var game_container: Node2D = $GameContainer
@onready var ui: Control = $UI

func _ready() -> void:
	GameManager.game_container = game_container
	GameManager.main_node = self
	
	ui.get_node("MainMenu").show()
