class_name Tiles
extends Panel

@onready var button_0: Button = $HorizontalTiles/Top/GridContainer/Button0
@onready var button_1: Button = $HorizontalTiles/Top/GridContainer/Button1
@onready var button_2: Button = $HorizontalTiles/Top/GridContainer/Button2
@onready var button_3: Button = $HorizontalTiles/Top/GridContainer/Button3
@onready var button_4: Button = $HorizontalTiles/Top/GridContainer/Button4
@onready var button_5: Button = $VerticalTiles/Right/GridContainer/Button5
@onready var button_6: Button = $VerticalTiles/Right/GridContainer/Button6
@onready var button_7: Button = $VerticalTiles/Right/GridContainer/Button7
@onready var button_8: Button = $HorizontalTiles/Bottom/GridContainer/Button8
@onready var button_9: Button = $HorizontalTiles/Bottom/GridContainer/Button9
@onready var button_10: Button = $HorizontalTiles/Bottom/GridContainer/Button10
@onready var button_11: Button = $HorizontalTiles/Bottom/GridContainer/Button11
@onready var button_12: Button = $HorizontalTiles/Bottom/GridContainer/Button12
@onready var button_13: Button = $VerticalTiles/Left/GridContainer/Button13
@onready var button_14: Button = $VerticalTiles/Left/GridContainer/Button14
@onready var button_15: Button = $VerticalTiles/Left/GridContainer/Button15

@onready var utils: Utils = %Utils

var _tiles_count: int = 0
var _idx_to_btns: Dictionary[int, Button]

func _ready() -> void:
	_idx_to_btns = {
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
	_tiles_count = _idx_to_btns.values().size()

func highlight_by(idx: int) -> void:
	pass
	

func animate_by(idx: int) -> void:
	# Keep remainder only from index
	var tile = get_normalized_by(idx)
	
	var w = tile.size.x / 4
	var h = tile.size.y / 4
	var x = tile.position.x
	var y = tile.position.y
	
	var position_start = Vector2(x + w, y + h)
	var position_end = Vector2(x, y)

	var scale_start = Vector2(0.5, 0.5)
	var scale_end = Vector2(1, 1)

	var speed = 0.15
	var position_tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_LINEAR)
	var scale_tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_LINEAR)

	position_tween.tween_property(tile, "position", position_start, speed)
	position_tween.tween_property(tile, "position", position_end, speed)

	scale_tween.tween_property(tile, "scale", scale_start, speed)
	scale_tween.tween_property(tile, "scale", scale_end, speed)
	
	await utils.timeout(speed * 2)

func get_normalized_by(idx: int) -> Button:
	# Keep remainder only from index
	return _idx_to_btns[idx % _tiles_count]
