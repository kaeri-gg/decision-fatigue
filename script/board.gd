class_name Board
extends Control

signal index_update(index: int)

@onready var tiles: Tiles = $TilesPanel
@onready var dice: Dice = $DiceContainer
@onready var roll_button: Button = %RollButton

const BoardScene: PackedScene = preload("res://scenes/board.tscn")

var index: int = 0

func on_roll_btn_pressed() -> void:
	if dice.is_rolling: 
		return

	roll_button.disabled = true
	await handle_dice_roll()
	roll_button.disabled = false

func handle_dice_roll() -> void:
	var value = await dice.roll(1.0)

	print("DICE value is: " + str(value))
	
	var old_index: int = index
	index += value # update index
	var new_index: int = index
	
	print("OLD: ", old_index, " NEW: ", new_index)

	await animate_in_sequence(old_index, new_index)
	await utils.timeout(1.5)
	
	index = tiles.normalize_index(new_index)
	index_update.emit(index)
	

func animate_in_sequence(from, to) -> void:
	# Function range(from, to); 
	# 'from' is inclusive
	# 'to' is not inclusive; we add 1
	for idx in range(from , to + 1):
		await tiles.animate_by(idx)
	
	tiles.highlight_by(to)

func reset() -> void:
	tiles.unhighlight_by(index)
	index = 0
	
func fade_in() -> void:
	await utils.fade_in(self)

func fade_out() -> void:
	await utils.fade_out(self)
