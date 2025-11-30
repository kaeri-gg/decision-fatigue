class_name Dialog
extends PanelContainer

signal yes_btn_clicked(payload: int)
signal no_btn_clicked(payload: int)

@onready var yes_button: Button = %YesButton
@onready var no_button: Button = %NoButton
@onready var player_label: Label = %PlayerLabel
@onready var npc_label: Label = %NPCLabel

var _id: int

func _ready() -> void:
	hide()
	yes_button.pressed.connect(_emit_accept)
	no_button.pressed.connect(_emit_cancel)

func show_dialog(context_text: String, prompt_text: String, id: int) -> void:
	_id = id
	update_content(context_text, prompt_text)
	await fade_in()

func hide_dialog() -> void:
	_id = -1
	await utils.timeout(1)
	await fade_out()

func update_content(context_text: String, prompt_text: String) -> void:
	player_label.text = context_text
	npc_label.text = prompt_text

func _emit_accept() -> void:
	yes_btn_clicked.emit(_id)
	hide_dialog()

func _emit_cancel() -> void:
	no_btn_clicked.emit(_id)
	hide_dialog()

func fade_in() -> void:
	await utils.fade_in(self)

func fade_out() -> void:
	await utils.fade_out(self)
