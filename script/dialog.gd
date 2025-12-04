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

const typing_delay: float = 0.03 # 30ms

func _ready() -> void:
	self.hide() # Built-in method
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

func show_dialog(context_text: String, prompt_text: String, topic: String) -> void:
	player_label.text = "" # Reset
	npc_label.text = "" # Reset
	npc.update_character_by(topic)
	var characters = max(context_text.length(), prompt_text.length())
	fake_typing(characters)
	animated_text(player_label, context_text)
	animated_text(npc_label, prompt_text)
	await fade_in()

# Fake animation, we iterate over text char by char
# Concatenate char with fixed delay
func animated_text(target: Label, value: String) -> void:
	for i in range(0, value.length()):
		target.text += value[i]
		await utils.timeout(typing_delay)

func fake_typing(characters: int) -> void:
	for i in range(0, characters):
		sound_manager.play("Typing", 0.025)
		await utils.timeout(typing_delay)

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
