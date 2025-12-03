class_name Dice
extends PanelContainer

@onready var _material: TextureRect = %Dice

# We make getter for variables that are not meant to be access outside this file
# We set getters only which prevents setting the value outside the script
# This way we mimic @Readonly feature for variable

# Manually aligned origin point, Dice width is 50
const ORIGIN: Vector2 = Vector2(-25, 0)

# @Public
var value: int = 1
var is_rolling: bool = false

# @Private
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
		value = randi_range(1, 6)
		_material.texture = _faces[value - 1]


# @Public, meant to be called in other scrips
func roll(roll_time_sec: float) -> int:
	sound_manager.play("Click")
	is_rolling = true

	var rolling_tween: Tween = create_tween()
	var moving_tween: Tween = create_tween()
	var bounce_fn: Tween = moving_tween.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
	var bounce_from: Vector2 = Vector2(randi_range(-50, 50), -50)

	_material.position = bounce_from

	rolling_tween.tween_property(_material, "rotation", rad_to_deg(15), roll_time_sec / 2)
	rolling_tween.tween_property(_material, "rotation", rad_to_deg(0), roll_time_sec / 2)

	bounce_fn.tween_property(_material, "position", ORIGIN, roll_time_sec)

	await utils.timeout(roll_time_sec)

	is_rolling = false
	
	return value
