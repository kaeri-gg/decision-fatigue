extends Control

@onready var show_board: Button = %"ShowBoard"
@onready var restart_game: Button = %"RestartGame"

const BoardScene = preload("res://scenes/board.tscn")

var board: Board

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show_board.pressed.connect(on_show_board_pressed)
	restart_game.pressed.connect(on_restart_game_pressed)

func on_show_board_pressed() -> void:
	board = BoardScene.instantiate()
	add_child(board)

func on_restart_game_pressed() -> void:
	remove_child(board)
