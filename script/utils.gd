class_name Utils
extends Node

# Awaits current line before moving to the next one. Awaitable
func timeout(delay: float) -> void:
	await get_tree().create_timer(delay).timeout


func fade_in(node: Control, duration: float = 0.4) -> void:
	node.modulate.a = 0.0
	node.visible = true
	var tween: Tween = node.get_tree().create_tween()
	tween.tween_property(node, "modulate:a", 1.0, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	await tween.finished
	
func fade_out(node: Control, duration: float = 0.4) -> void:
	var tween: Tween = node.get_tree().create_tween()
	tween.tween_property(node, "modulate:a", 0.0, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	await tween.finished
	node.visible = false
