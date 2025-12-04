class_name Board
extends Control

signal index_update(index: int)

@onready var tiles: Tiles = $TilesPanel
@onready var dice: Dice = $DiceContainer
@onready var roll_button: Button = %RollButton

const BoardScene: PackedScene = preload("res://scenes/board.tscn")

var index: int = 0 # Index of my tiles

func on_roll_btn_pressed() -> void:
	if dice.is_rolling: 
		return # Do nothing! already rolling and keep disabling the button

	roll_button.disabled = true
	await handle_dice_roll()
	roll_button.disabled = false

func handle_dice_roll() -> void:
	
	sound_manager.play("Roll")
	var dice_value = await dice.roll(1.0) 
	
	var old_index: int = index
	index += dice_value # update index
	var new_index: int = index
	
	await animate(old_index, new_index)
	await utils.timeout(1.0) # Delay for u to see which tile u landed 
	
	index = tiles.get_tile_index(new_index)
	index_update.emit(index)
	
# Animates the tiles in sequense
func animate(from, to) -> void:
	# Function range(from, to); 
	# 'from' is inclusive
	# 'to' is not inclusive; we add 1 to animate last index
	for idx in range(from, to + 1):
		await tiles.animate_by(idx)
	
	tiles.highlight_by(to) # Keeps the index highlighted

# Unhighlights last highlighted tile and resets the index
func reset() -> void:
	tiles.unhighlight_by(index)
	index = 0 # Reset
	
func fade_in() -> void:
	# 'self' is like 'this' in JS, 
	# it represents current context, 
	# which is Board instance in this case
	await utils.fade_in(self) 

func fade_out() -> void:
	await utils.fade_out(self)
