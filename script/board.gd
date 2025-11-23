extends Control

# Dice elements
@onready var dice: Dice = $DiceContainer
@onready var roll_button: Button = $DiceContainer/VBoxContainer/RollButton
@onready var player_icon: CharacterBody2D = $PlayerIcon

# Tiles
@onready var button_0: Button = $TilesPanel/HorizontalTiles/Top/GridContainer/Button0
@onready var button_1: Button = $TilesPanel/HorizontalTiles/Top/GridContainer/Button1
@onready var button_2: Button = $TilesPanel/HorizontalTiles/Top/GridContainer/Button2
@onready var button_3: Button = $TilesPanel/HorizontalTiles/Top/GridContainer/Button3
@onready var button_4: Button = $TilesPanel/HorizontalTiles/Top/GridContainer/Button4
@onready var button_5: Button = $TilesPanel/VerticalTiles/Right/GridContainer/Button5
@onready var button_6: Button = $TilesPanel/VerticalTiles/Right/GridContainer/Button6
@onready var button_7: Button = $TilesPanel/VerticalTiles/Right/GridContainer/Button7
@onready var button_8: Button = $TilesPanel/HorizontalTiles/Bottom/GridContainer/Button8
@onready var button_9: Button = $TilesPanel/HorizontalTiles/Bottom/GridContainer/Button9
@onready var button_10: Button = $TilesPanel/HorizontalTiles/Bottom/GridContainer/Button10
@onready var button_11: Button = $TilesPanel/HorizontalTiles/Bottom/GridContainer/Button11
@onready var button_12: Button = $TilesPanel/HorizontalTiles/Bottom/GridContainer/Button12
@onready var button_13: Button = $TilesPanel/VerticalTiles/Left/GridContainer/Button13
@onready var button_14: Button = $TilesPanel/VerticalTiles/Left/GridContainer/Button14
@onready var button_15: Button = $TilesPanel/VerticalTiles/Left/GridContainer/Button15

var tween: Tween
var tile_buttons: Dictionary = {}
 
func _ready() -> void: 
	
	roll_button.pressed.connect(on_roll_btn_pressed)
	
	tile_buttons = {
		0: button_0,
		1: button_1,
		2: button_2,
		3: button_3,
		4: button_4,
		5: button_5,
		6: button_6,
		7: button_7,
		8: button_8,
		9: button_9,
		10: button_10,
		11: button_11,
		12: button_12,
		13: button_13,
		14: button_14,
		15: button_15
	}
	
func on_roll_btn_pressed() -> void:
	if dice.is_rolling:
		return
	
	print("Rolling...")
	roll_button.disabled = true
	await dice.roll(1.0)
	#await set_timeout(1)
	on_roll_finished()
	print('Finished')
	roll_button.disabled = false

func on_roll_finished() -> void:
	print("DICE value is: " + str(dice.value))
