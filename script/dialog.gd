class_name Dialog
extends PanelContainer

signal on_accept(payload)
signal on_cancel(payload)

@onready var _accept_button: Button = $"MarginContainer/GridContainer/VBoxContainer/Button"
@onready var _cancel_button: Button = $"MarginContainer/GridContainer/VBoxContainer/Button2"
@onready var _context_label: Label = $"MarginContainer/GridContainer/HBoxContainer/Label"
@onready var _prompt_label: Label = $"MarginContainer/GridContainer2/Label"

var _id: int

func _ready() -> void:
	hide()
	_accept_button.pressed.connect(_emit_accept)
	_cancel_button.pressed.connect(_emit_cancel)

func show_dialog(context_text: String, prompt_text: String, id: int) -> void:
	_id = id
	update_content(context_text, prompt_text)
	show()

func hide_dialog() -> void:
	_id = -1
	hide()

func update_content(context_text: String, prompt_text: String) -> void:
	_context_label.text = context_text
	_prompt_label.text = prompt_text

func _emit_accept() -> void:
	emit_signal("on_accept", _id)
	hide_dialog()

func _emit_cancel() -> void:
	emit_signal("on_cancel", _id)
	hide_dialog()
