class_name GameState
extends Node

# Signals emitted when stats change
signal stats_changed(changed_stat: Dictionary, global_stats: Dictionary)
signal game_finish(reason: String)

var happiness: int = 0
var money: int = 0
var respect: int = 0
var relationship: int = 0

func _ready() -> void:
	reset_stats()
	print("Game state initialized.")
	
# Get current stats as a dictionary
func get_stats() -> Dictionary:
	return {
		"happiness": happiness,
		"money": money,
		"respect": respect,
		"relationship": relationship
	}

# Modify player stats by modified amounts
func modify_stats(modified_stats: Dictionary) -> void:
	# Money can be negative(debt) no clamping with min/max values
	money = money + modified_stats.get('money')
	
	happiness = clamp(happiness + modified_stats.get('happiness'), 0, 100)
	respect = clamp(respect + modified_stats.get('respect'), 0, 100)
	relationship = clamp(relationship + modified_stats.get('relationship'), 0, 100)
	
	# Emit signal with current stats
	stats_changed.emit(modified_stats, get_stats())
	
	# Check if game is over
	check_game_finish()

# Check if game is over (any stat at 0 or all at 100)
func check_game_finish() -> void:
	# Lose condition: any stat reaches 0
	if happiness <= 0:
		game_finish.emit("You became too unhappy and gave up.")
	elif money <= 0:
		game_finish.emit("You went broke and can't continue.")
	elif respect <= 0:
		game_finish.emit("You lost all respect and were ostracized.")
	elif relationship <= 0:
		game_finish.emit("All your relationships fell apart.")
	elif is_win():
		game_finish.emit("You win but, this is not actually something that measures happiness in real life. Thank you for trying to stay kind and have a balance in your life!")

func is_win() -> bool:
	return happiness >= 95 or respect >= 95 or relationship >= 95

func is_lose() -> bool:
	return happiness <= 0 or money <= 0 or respect <= 0 or relationship <= 0

# Check if game is currently over
func is_game_finish() -> bool:
	return is_win() or is_lose()

# Reset stats to default values
func reset_stats() -> void:
	happiness = 50
	money = 50
	respect =  50
	relationship = 50
	stats_changed.emit(get_stats(), get_stats())
