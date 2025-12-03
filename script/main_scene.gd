class_name MainScene
extends Control

# Progress bars
@onready var happiness_bar: ProgressBar = %HappinessBar
@onready var respect_bar: ProgressBar = %RespectBar
@onready var relationship_bar: ProgressBar = %RelationshipBar

# Notification label
@onready var notification_label: Label = %NotificationLabel
@onready var player_name: Label = %PlayerName
@onready var npc_name: Label = %NPCName

@onready var dialog: Dialog = %Dialog
@onready var stats: Stats = %Stats

@onready var game_over: PanelContainer = %GameOver

const BoardScene: PackedScene = preload("res://scenes/board.tscn")
const scenarios := preload("res://script/scenarios.gd")

# Class defined in board.gd, global type
var board: Board = BoardScene.instantiate()
var active_scenario: Dictionary = {}
var active_tile: int = -1

func _ready() -> void:
	notification_label.text = ""
	game_over.hide()
	
	# Initialise the board
	await utils.fade_in(self)
	# Add board into current scene
	add_child(board)
	board.index_update.connect(on_index_update)
	await board.fade_in()
	
	# Connect to game_state and dialog signals
	game_state.stats_changed.connect(on_stats_changed)
	game_state.game_over.connect(on_game_over)
	dialog.yes_btn_clicked.connect(on_dialog_yes)
	dialog.no_btn_clicked.connect(on_dialog_no)
	
	# Initialize UI with current stats
	stats.reset() # Remove default UI values
	stats.update_bars(game_state.get_stats())

func on_show_board_pressed() -> void:
	sound_manager.play("Click")
	await board.fade_in()

func on_restart_game_pressed() -> void:
	print("Restart requested")
	sound_manager.play("Click")
	if board and board.get_parent():
		board.reset()
		
	# Reset game state
	game_state.reset_stats()
	dialog.hide_dialog()
	clear_active_scenario()

	stats.reset()
	stats.update_bars(game_state.get_stats())

# Called when game_state stats change
func on_stats_changed(changed_stat: Dictionary, global_stats: Dictionary) -> void:
	stats.update(changed_stat, global_stats)

func on_game_over(reason: String) -> void:
	game_over.show()
	player_name.hide()
	npc_name.hide()
	
	print("Game Over: ", reason)
	if board:
		await board.fade_out()

func on_index_update(index: int) -> void:
	if game_state.is_game_over():
		return
	
	var scenario: Dictionary = pick_scenario_for_tile(index)
	if scenario.is_empty():
		dialog.hide_dialog()
		# To figure out whether our data is corrupted
		OS.alert("No such scenario by idx: " + str(index), "Alert!")
		return

	await board.fade_out()

	active_tile = index
	active_scenario = scenario
	
	var topic: String = scenario.get("topic", "")
	var context: String = scenario.get("context", "")
	var prompt: String = scenario.get("prompt", "")
	
	dialog.show_dialog(context, prompt)
	
	notification_label.text =  "You landed on tile #" + str(index) + " - " + topic

func pick_scenario_for_tile(index: int) -> Dictionary:
	if not scenarios.tiles.get(index):
		return {}

	var data: Dictionary = scenarios.tiles.get(index)
	var options: Array = data.get("scenarios", [])
	if options.is_empty():
		return {}

	var scenario: Dictionary = options[randi() % options.size()].duplicate()
	# Carry topic info forward for UI, we add additional property to scenario
	scenario["topic"] = data.get("topic", "")
	
	return scenario

func on_dialog_yes() -> void:
	apply_decision("yes")

func on_dialog_no() -> void:
	apply_decision("no")

func apply_decision(yes_or_no: String) -> void:
	if active_scenario.is_empty(): 
		return
	
	await board.fade_in()
	var answer_stats: Dictionary = active_scenario.get(yes_or_no)
	game_state.modify_stats(answer_stats)
	
	clear_active_scenario()

func clear_active_scenario() -> void:
	active_scenario.clear()
	active_tile = -1
