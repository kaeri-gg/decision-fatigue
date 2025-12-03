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
	yes_button.pressed.connect(emit_accept)
	no_button.pressed.connect(emit_cancel)

func emit_accept() -> void:
	sound_manager.play("Click")
	yes_btn_clicked.emit()
	hide_dialog()

func emit_cancel() -> void:
	sound_manager.play("Click")
	no_btn_clicked.emit()
	hide_dialog()

func show_dialog(context_text: String, prompt_text: String) -> void:
	animated_text(player_label, context_text)
	animated_text(npc_label, prompt_text)
	await fade_in()

func hide_dialog() -> void:
	await utils.timeout(1) # Extra delay
	await fade_out()

func fade_in() -> void:
	utils.fade_in(self)
	await npc.slide_in()
	await player.slide_in()

func fade_out() -> void:
	utils.fade_out(self)
	await npc.slide_out()
	await player.slide_out()

func animated_text(target: Label, value: String) -> void:
	for i in range(0, value.length()):
		target.text += value[i]
		await utils.timeout(0.03) # 30ms per char