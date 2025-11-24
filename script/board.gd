class_name Board
extends Control

@onready var tiles: Tiles = $TilesPanel
@onready var dice: Dice = $DiceContainer
@onready var button: Button = $DiceContainer/VBoxContainer/RollButton
@onready var player: Player = %Player


func _ready() -> void:
	button.pressed.connect(on_roll_btn_pressed)

func on_roll_btn_pressed() -> void:
	if dice.is_rolling: 
		return

	button.disabled = true
	await handle_dice_roll()
	button.disabled = false

func handle_dice_roll() -> void:
	var value = await dice.roll(1.0)

	print("DICE value is: " + str(value))
	
	var old_index = player.get_idx()
	var new_index = player.add_idx_by(value)
	
	print("OLD: ", old_index, " NEW: ", new_index)

	await animate_in_sequense(old_index, new_index)
	

func animate_in_sequense(from, to) -> void:
	tiles.unhighlight_by(from)

	# Function range(from, to); 
	# 'from' is inclusive but we do not need to animate it; we add 1
	# 'to' is not inclusive; we add 1
	for idx in range(from + 1, to + 1):
		await tiles.animate_by(idx)
	
	tiles.highlight_by(to)
