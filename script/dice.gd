class_name Dice
extends PanelContainer

@onready var _material: TextureRect = $VBoxContainer/CenterContainer/Dice

# We make getter for variables that are not meant to be access outside this file
# We set getters only which prevents setting the value outside the script
# This way we mimic @Readonly feature for variable

# Manually aligned origin point
const ORIGIN = Vector2(-25, 0)

var value: int:
	## @Readonly
	get: return value

var is_rolling: bool:
	## @Readonly
	get: return is_rolling
	
	## @Private
var _faces: Array[Resource] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_faces.append(load("res://assets/images/dice/dice-01.png"))
	_faces.append(load("res://assets/images/dice/dice-02.png"))
	_faces.append(load("res://assets/images/dice/dice-03.png"))
	_faces.append(load("res://assets/images/dice/dice-04.png"))
	_faces.append(load("res://assets/images/dice/dice-05.png"))
	_faces.append(load("res://assets/images/dice/dice-06.png"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if is_rolling:
		value = _get_random_value(1, 6)
		_material.texture = _faces[value -1]

# Returns random int value between 1-6 inclusive
func _get_random_value(_min: int, _max: int) -> int:
	return randi() % _max + _min

# Delay next fn execution. Awaitable
func _timeout(delay: float) -> void:
	await get_tree().create_timer(delay).timeout

# @Public, meant to be called in other scrips
func roll(roll_time_sec: float) -> void:
	is_rolling = true
	var rolling_tween = create_tween()
	var moving_tween = create_tween()
	var bounce_fn = moving_tween.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
	var bounce_from = Vector2(_get_random_value(-50, 50), -50)
	
	_material.position = bounce_from
	
	rolling_tween.tween_property(_material, "rotation", rad_to_deg(15), roll_time_sec / 2)
	rolling_tween.tween_property(_material, "rotation", rad_to_deg(0), roll_time_sec / 2)
	
	bounce_fn.tween_property(_material, "position", ORIGIN, roll_time_sec)
	
	await _timeout(roll_time_sec)
	
	is_rolling = false
