class_name Tiles
extends Panel

const HIGHLIGHTED = preload("res://themes/button/highlighted.tres")
const NORMAL = preload("res://themes/button/normal.tres")

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

var _tiles_count: int = 0
var _idx_to_btns: Array[Button]

func _ready() -> void:
	_idx_to_btns = [
		button_0,
		button_1,
		button_2,
		button_3,
		button_4,
		button_5,
		button_6,
		button_7,
		button_8,
		button_9,
		button_10,
		button_11,
		button_12,
		button_13,
		button_14,
		button_15
	]
	_tiles_count = _idx_to_btns.size()

func highlight_by(idx: int) -> void:
	var tile: Button = get_normalized_by(idx)
	tile.set_theme(HIGHLIGHTED)

func unhighlight_by(idx: int) -> void:
	var tile: Button = get_normalized_by(idx)
	tile.set_theme(NORMAL)

func animate_by(idx: int) -> void:
	# Apply highlighted style
	highlight_by(idx)

	# Keep remainder only from index
	var tile: Button = get_normalized_by(idx)
	
	var w: float = tile.size.x / 4
	var h: float = tile.size.y / 4
	var x: float = tile.position.x
	var y: float = tile.position.y
	
	var position_start: Vector2 = Vector2(x + w, y + h)
	var position_end: Vector2 = Vector2(x, y)

	var scale_start: Vector2 = Vector2(0.5, 0.5)
	var scale_end: Vector2 = Vector2(1, 1)

	var speed: float = 0.15
	var position_tween: Tween = create_tween().set_trans(Tween.TRANS_LINEAR)
	var scale_tween: Tween = create_tween().set_trans(Tween.TRANS_LINEAR)

	position_tween.tween_property(tile, "position", position_start, speed)
	position_tween.tween_property(tile, "position", position_end, speed)

	scale_tween.tween_property(tile, "scale", scale_start, speed)
	scale_tween.tween_property(tile, "scale", scale_end, speed)
	
	await utils.timeout(speed * 2)
	# Reset style
	unhighlight_by(idx)

func normalize_index(idx: int) -> int:
	return idx % _tiles_count

func get_tile_count() -> int:
	return _tiles_count

func get_normalized_by(idx: int) -> Button:
	# Keep remainder only from index
	return _idx_to_btns[normalize_index(idx)]
