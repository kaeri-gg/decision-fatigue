class_name StartButton
extends Button

@onready var start_button: Button = %"StartButton"
@onready var root := get_tree().get_current_scene()

const game_scene: PackedScene = preload("res://scenes/main_scene.tscn")

func on_start_button_pressed() -> void:
	start_button.text = "Loading..."
	await utils.timeout(0.5)
	await utils.fade_out(root)
	get_tree().change_scene_to_packed(game_scene)
