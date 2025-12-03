extends Node

func play(sound_name: String) -> void:
	var player := get_node_or_null(sound_name)
	if player:
		player.play()
	else:
		print("Sound not found:", sound_name)
