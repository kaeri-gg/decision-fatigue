class_name Dice
extends PanelContainer

@onready var dice: TextureRect = %Dice

# Manually aligned origin point, Dice width is 50
const ORIGIN: Vector2 = Vector2(-25, 0)

var value: int = 1
var is_rolling: bool = false

var faces: Array[Resource] = []

func _ready() -> void:
	faces.append(load("res://assets/images/dice/dice-01.png"))
	faces.append(load("res://assets/images/dice/dice-02.png"))
	faces.append(load("res://assets/images/dice/dice-03.png"))
	faces.append(load("res://assets/images/dice/dice-04.png"))
	faces.append(load("res://assets/images/dice/dice-05.png"))
	faces.append(load("res://assets/images/dice/dice-06.png"))

func _process(_delta: float) -> void:
	if is_rolling:
		value = randi_range(1, 6)
		dice.texture = faces[value - 1] # My value are 1-6, but array is 0-5

func roll(roll_time_sec: float) -> int:
	sound_manager.play("Click")
	is_rolling = true

	var rolling_tween: Tween = create_tween()
	var moving_tween: Tween = create_tween()
	var bounce_fn: Tween = moving_tween.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
	var bounce_from: Vector2 = Vector2(randi_range(-50, 50), -50)

	dice.position = bounce_from

	rolling_tween.tween_property(dice, "rotation", rad_to_deg(15), roll_time_sec / 2)
	rolling_tween.tween_property(dice, "rotation", rad_to_deg(0), roll_time_sec / 2)

	bounce_fn.tween_property(dice, "position", ORIGIN, roll_time_sec)

	await utils.timeout(roll_time_sec)

	is_rolling = false
	
	return value
