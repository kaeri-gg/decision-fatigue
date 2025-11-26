extends Control

@onready var show_board: Button = %"ShowBoard"
@onready var restart_game: Button = %"RestartGame"

const BoardScene = preload("res://scenes/board.tscn")

var board: Board

func _on_show_board_pressed() -> void:
	if board and is_instance_valid(board):
		board.show()
		#board.raise()
		return

	board = BoardScene.instantiate()
	add_child(board)


func _on_restart_game_pressed() -> void:
	if board and board.get_parent():
		remove_child(board)
		board.queue_free()
	board = null
