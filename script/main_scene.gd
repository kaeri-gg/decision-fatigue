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

@onready var dialog: Dialog = $Dialog
@onready var notification_label: Label = $StandingContainer/NotificationContainer/Margin/NotificationLabel

const BoardScene = preload("res://scenes/board.tscn")
const ScenarioData = preload("res://script/scenarios.gd")

# Class defined in board.gd, global type
var board: Board
var _active_scenario: Dictionary = {}
var _active_tile: int = -1

func _ready() -> void:
	# Connect to GameState signals
	GameState.stats_changed.connect(_on_stats_changed)
	GameState.game_over.connect(_on_game_over)
	dialog.on_accept.connect(_on_dialog_accept)
	dialog.on_cancel.connect(_on_dialog_cancel)
	
	# Initialize UI with current stats
	_update_stat_bars(GameState.get_stats())

func _on_show_board_pressed() -> void:
	if board and is_instance_valid(board):
		board.show()
		return

	board = BoardScene.instantiate()
	add_child(board)
	board.tile_landed.connect(_on_tile_landed)

func _on_restart_game_pressed() -> void:
	if board and board.get_parent():
		remove_child(board)
		board.queue_free()
	board = null
	# Reset game state
	GameState.reset_stats()
	dialog.hide_dialog()
	_clear_active_scenario()

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

func _on_tile_landed(tile_index: int) -> void:
	if GameState.is_game_over():
		return
	var scenario = _pick_scenario_for_tile(tile_index)
	if scenario.is_empty():
		dialog.hide_dialog()
		return
	_active_tile = tile_index
	_active_scenario = scenario
	var context_text = "%s — %s" % [scenario.get("topic", "Event"), scenario.get("context", "")]
	dialog.show_dialog(context_text, scenario.get("prompt", ""), tile_index)
	notification_label.text = "You landed on tile %d: %s" % [tile_index, scenario.get("topic", "Event")]

func _pick_scenario_for_tile(tile_index: int) -> Dictionary:
	if not ScenarioData.TILE_EVENTS.has(tile_index):
		return {}
	var tile_data: Dictionary = ScenarioData.TILE_EVENTS[tile_index]
	var options: Array = tile_data.get("scenarios", [])
	if options.is_empty():
		return {}
	var scenario: Dictionary = options[randi() % options.size()].duplicate()
	# Carry topic info forward for UI
	scenario["topic"] = tile_data.get("topic", "Event")
	return scenario

func _on_dialog_accept(_id: int) -> void:
	_apply_decision("yes")

func _on_dialog_cancel(_id: int) -> void:
	_apply_decision("no")

func _apply_decision(decision: String) -> void:
	if _active_scenario.is_empty():
		return
	var delta: Dictionary = _active_scenario.get("%s_delta" % decision, {})
	GameState.modify_stats(
		int(delta.get("happiness", 0)),
		int(delta.get("money", 0)),
		int(delta.get("respect", 0)),
		int(delta.get("relationship", 0))
	)
	notification_label.text = "%s (%s): %s" % [
		decision.capitalize(),
		_active_scenario.get("topic", "Event"),
		GameState.format_stat_changes(
			int(delta.get("happiness", 0)),
			int(delta.get("money", 0)),
			int(delta.get("respect", 0)),
			int(delta.get("relationship", 0))
		)
	]
	_clear_active_scenario()

func _clear_active_scenario() -> void:
	_active_scenario.clear()
	_active_tile = -1
