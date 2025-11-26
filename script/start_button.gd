extends Button

@onready var start_button: Button = %"StartButton"
@onready var timer: Timer = %Timer

const game_scene = preload("res://scenes/main_scene.tscn")

func on_start_button_pressed() -> void:
	start_button.text = "Loading..."
	timer.start(1)

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_packed(game_scene)
	timer.stop()
