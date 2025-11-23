extends Button

@onready var start_button: Button = %"Start button"
@onready var timer: Timer = %Timer

const game_scene = preload("res://scenes/main_scene.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_button.pressed.connect(on_start_button_pressed)

func on_start_button_pressed() -> void:
	start_button.text = "Loading..."
	timer.start(1)

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_packed(game_scene)
	timer.stop()
