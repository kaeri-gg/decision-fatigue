class_name Utils
extends Node

# Awaits current line before moving to the next one. Awaitable
func timeout(delay: float) -> void:
	await get_tree().create_timer(delay).timeout
