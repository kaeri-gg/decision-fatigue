class_name Player
extends Node

var index: int = 0

func add_idx_by(val: int) -> int:
	index += val # Add Dice value
	
	return index

func get_idx() -> int:
	return index
