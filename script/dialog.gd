class_name Dialog
extends PanelContainer

signal yes_btn_clicked()
signal no_btn_clicked()

@onready var yes_button: Button = %YesButton
@onready var no_button: Button = %NoButton
@onready var player_label: Label = %PlayerLabel
@onready var npc_label: Label = %NPCLabel
@onready var player: Player = %PlayerMood
@onready var npc: NPC = %NPCCharacter

func _ready() -> void:
	hide()
	yes_button.pressed.connect(_emit_accept)
	no_button.pressed.connect(_emit_cancel)

func show_dialog(context_text: String, prompt_text: String) -> void:
	update_content(context_text, prompt_text)
	await fade_in()

func hide_dialog() -> void:
	await utils.timeout(1)
	await fade_out()

func update_content(context_text: String, prompt_text: String) -> void:
	player_label.text = context_text
	npc_label.text = prompt_text

func _emit_accept() -> void:
	sound_manager.play("Click")
	yes_btn_clicked.emit()
	hide_dialog()

func _emit_cancel() -> void:
	sound_manager.play("Click")
	no_btn_clicked.emit()
	hide_dialog()

func fade_in() -> void:
	await utils.fade_in(self)
	await npc.slide_in()
	await player.slide_in()

func fade_out() -> void:
	await utils.fade_out(self)
	await npc.slide_out()
	await player.slide_out()
