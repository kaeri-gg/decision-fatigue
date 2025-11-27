extends Control

@onready var show_board: Button = %"ShowBoard"
@onready var restart_game: Button = %"RestartGame"

# Progress bars
@onready var happiness_bar: ProgressBar = $StandingContainer/Margin/Grid/Bars/HappinessBar
@onready var money_bar: ProgressBar = $StandingContainer/Margin/Grid/Bars/MoneyBar
@onready var respect_bar: ProgressBar = $StandingContainer/Margin/Grid/Bars/RespectBar
@onready var relationship_bar: ProgressBar = $StandingContainer/Margin/Grid/Bars/RelationshipBar


# Stat delta labels
@onready var happiness_point: Label = $StandingContainer/Margin/Grid/Stats/HappinessPoint
@onready var money_point: Label = $StandingContainer/Margin/Grid/Stats/MoneyPoint
@onready var respect_point: Label = $StandingContainer/Margin/Grid/Stats/RespectPoint
@onready var relationship_point: Label = $StandingContainer/Margin/Grid/Stats/RelationshipPoint


const BoardScene = preload("res://scenes/board.tscn")

var board: Board

func _ready() -> void:
	# Connect to GameState signals
	GameState.stats_changed.connect(_on_stats_changed)
	GameState.game_over.connect(_on_game_over)
	
	# Initialize UI with current stats
	_update_stat_bars(GameState.get_stats())

func _on_show_board_pressed() -> void:
	if board and is_instance_valid(board):
		board.show()
		return

	board = BoardScene.instantiate()
	add_child(board)

func _on_restart_game_pressed() -> void:
	if board and board.get_parent():
		remove_child(board)
		board.queue_free()
	board = null
	# Reset game state
	GameState.reset_stats()

# Called when GameState stats change
func _on_stats_changed(stats: Dictionary) -> void:
	_update_stat_bars(stats)

func _update_stat_bars(stats: Dictionary) -> void:
	happiness_bar.value = stats["happiness"]
	money_bar.value = stats["money"]
	respect_bar.value = stats["respect"]
	relationship_bar.value = stats["relationship"]
	
	# Update delta labels (showing current values for now)
	happiness_point.text = str(stats["happiness"])
	money_point.text = str(stats["money"])
	respect_point.text = str(stats["respect"])
	relationship_point.text = str(stats["relationship"])

func _on_game_over(reason: String) -> void:
	print("Game Over: ", reason)
	# TODO: Show game over screen
	if board:
		board.hide()
