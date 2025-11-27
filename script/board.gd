class_name Board
extends Control

@onready var tiles: Tiles = $TilesPanel
@onready var dice: Dice = $DiceContainer
@onready var button: Button = $DiceContainer/VBoxContainer/RollButton
@onready var player: Player = %Player
@onready var background: Panel = %Background

const BoardScene = preload("res://scenes/board.tscn")

func on_roll_btn_pressed() -> void:
	if dice.is_rolling: 
		return

	button.disabled = true
	await handle_dice_roll()
	button.disabled = false

func handle_dice_roll() -> void:
	var value = await dice.roll(1.0)

	print("DICE value is: " + str(value))
	
	var old_index = player.index
	player.index += value # update index
	var new_index = player.index
	
	print("OLD: ", old_index, " NEW: ", new_index)

	await animate_in_sequence(old_index, new_index)

func animate_in_sequence(from, to) -> void:
	# Function range(from, to); 
	# 'from' is inclusive
	# 'to' is not inclusive; we add 1
	for idx in range(from , to + 1):
		await tiles.animate_by(idx)
	
	tiles.highlight_by(to)

func _on_board_background_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		hide()
