extends Control

@onready var show_board: Button = %"ShowBoard"
@onready var restart_game: Button = %"RestartGame"

const board = preload("res://scenes/board.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show_board.pressed.connect(on_show_board_pressed)

func on_show_board_pressed() -> void:
	var loadBoard = board.instantiate()
	add_child(loadBoard)
