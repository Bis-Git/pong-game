extends Node

# Game data
var game_mode = ""
var player1_score = 0
var player2_score = 0

# Reference to the GameContainer node
var game_container: Node2D

@export var main_node: Node

func start_game(mode: String):
	game_mode = mode
	player1_score = 0
	player2_score = 0
	
	load_game_scene("res://scenes/game.tscn")

func load_game_scene(scene_path: String):
	free_container()
	
	var new_scene = load(scene_path).instantiate() as Node2D
	game_container.add_child(new_scene)

func update_score(player: String):
	if player == "player1":
		player1_score += 1
	elif player == "player2":
		player2_score += 1
	
	if player1_score >= 5 or player2_score >= 5:
		end_game()

func end_game():
	main_node.get_node("UI").get_node("GameOverScreen").show()
	free_container()

func free_container():
	if game_container and game_container.get_child_count() > 0:
		for child in game_container.get_children():
			child.queue_free()
