class_name StartButton
extends Button

@onready var start_button: Button = %"StartButton"

const game_scene = preload("res://scenes/main_scene.tscn")

func on_start_button_pressed() -> void:
	start_button.text = "Loading..."
	await utils.timeout(0.2)
	get_tree().change_scene_to_packed(game_scene)
