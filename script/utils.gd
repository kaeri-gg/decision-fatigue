class_name Utils
extends Node

# Awaits current line before moving to the next one. Awaitable
func timeout(delay: float) -> void:
	await get_tree().create_timer(delay).timeout

# Returns random int value between 1-6 inclusive
func get_random_value(_min: int, _max: int) -> int:
	return randi() % _max + _min
