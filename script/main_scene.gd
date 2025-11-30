class_name MainScene
extends Control

@onready var restart_game: Button = %RestartGame
@onready var show_board: Button = %ShowBoard

# Progress bars
@onready var happiness_bar: ProgressBar = %HappinessBar
@onready var money_bar: ProgressBar = %MoneyBar
@onready var respect_bar: ProgressBar = %RespectBar
@onready var relationship_bar: ProgressBar = %RelationshipBar

# Notification label
@onready var notification_label: Label = %NotificationLabel

@onready var dialog: Dialog = %Dialog
@onready var stats: Stats = %Stats

const BoardScene: PackedScene = preload("res://scenes/board.tscn")
const scenarios = preload("res://script/scenarios.gd")

# Class defined in board.gd, global type
var board: Board = BoardScene.instantiate()
var active_scenario: Dictionary = {}
var active_tile: int = -1

func _ready() -> void:
	# Initialise the board
	await utils.fade_in(self)
	
	board.hide()
	add_child(board)
	board.index_update.connect(on_index_update)
	
	# Connect to gameState and dialog signals
	gameState.stats_changed.connect(on_stats_changed)
	gameState.game_over.connect(on_game_over)
	dialog.yes_btn_clicked.connect(on_dialog_yes)
	dialog.no_btn_clicked.connect(on_dialog_no)
	
	# Initialize UI with current stats
	stats.update_bars(gameState.get_stats())

func on_show_board_pressed() -> void:
	await board.fade_in()
	#board.show()

func on_restart_game_pressed() -> void:
	if board and board.get_parent():
		board.reset()
		
	# Reset game state
	gameState.reset_stats()
	dialog.hide_dialog()
	clear_active_scenario()

# Called when GameState stats change
func on_stats_changed(changed_stat: Dictionary, global_stats: Dictionary) -> void:
	stats.update(changed_stat, global_stats)

func on_game_over(reason: String) -> void:
	print("Game Over: ", reason)
	# TODO: create game over screen
	if board:
		await board.fade_out()

func on_index_update(tile_index: int) -> void:
	if gameState.is_game_over():
		return
	var scenario: Dictionary = pick_scenario_for_tile(tile_index)
	if scenario.is_empty():
		dialog.hide_dialog()
		OS.alert("No such scenario by idx: " + str(tile_index), "Alert!")
		return
		
	active_tile = tile_index
	active_scenario = scenario
	var context_text: String = "%s — %s" % [scenario.get("topic", "Event"), scenario.get("context", "")]
	dialog.show_dialog(context_text, scenario.get("prompt"), tile_index)
	
	await board.fade_out()
	notification_label.text = "You landed on tile %d: %s" % [tile_index, scenario.get("topic", "Event")]

func pick_scenario_for_tile(tile_index: int) -> Dictionary:
	if not scenarios.tiles.get(tile_index):
		return {}

	var tile_data: Dictionary = scenarios.tiles.get(tile_index)
	var options: Array = tile_data.get("scenarios", [])
	if options.is_empty():
		return {}

	var scenario: Dictionary = options[randi() % options.size()].duplicate()
	# Carry topic info forward for UI
	scenario["topic"] = tile_data.get("topic", "Event")
	
	return scenario

func on_dialog_yes(_id: int) -> void:
	apply_decision("yes")

func on_dialog_no(_id: int) -> void:
	apply_decision("no")

func apply_decision(yes_or_no: String) -> void:
	if active_scenario.is_empty(): 
		return
	
	await board.fade_in()
	var answer_stats: Dictionary = active_scenario.get(yes_or_no)
	gameState.modify_stats(answer_stats)
	
	clear_active_scenario()

func clear_active_scenario() -> void:
	active_scenario.clear()
	active_tile = -1
