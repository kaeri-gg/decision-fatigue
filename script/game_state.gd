extends Node

# Signals emitted when stats change
signal stats_changed(stats: Dictionary)
signal game_over(reason: String)

# Player stats (TODO: Randomise based on social class.)
var happiness: int = 50
var money: int = 50
var respect: int = 50
var relationship: int = 50

func _ready() -> void:
	print("GameState initialized")

# Modify player stats by delta amounts
func modify_stats(happiness_delta: int, money_delta: int, respect_delta: int, relationship_delta: int) -> void:
	happiness = clamp(happiness + happiness_delta, 0, 100)
	money = clamp(money + money_delta, 0, 100)
	respect = clamp(respect + respect_delta, 0, 100)
	relationship = clamp(relationship + relationship_delta, 0, 100)
	
	# Emit signal with current stats
	stats_changed.emit(get_stats())
	
	# Check if game is over
	check_game_over()

# Get current stats as a dictionary
func get_stats() -> Dictionary:
	return {
		"happiness": happiness,
		"money": money,
		"respect": respect,
		"relationship": relationship
	}

# Check if game is over (any stat at 0 or all at 100)
func check_game_over() -> void:
	# Lose condition: any stat reaches 0
	if happiness <= 0:
		game_over.emit("You became too unhappy and gave up.")
	elif money <= 0:
		game_over.emit("You went broke and can't continue.")
	elif respect <= 0:
		game_over.emit("You lost all respect and were ostracized.")
	elif relationship <= 0:
		game_over.emit("All your relationships fell apart.")
	# Win condition: all stats at 100
	elif happiness >= 100 and money >= 100 and respect >= 100 and relationship >= 100:
		game_over.emit("Perfect balance! You mastered life!")

# Check if game is currently over
func is_game_over() -> bool:
	return (happiness <= 0 or money <= 0 or respect <= 0 or relationship <= 0 or 
			(happiness >= 100 and money >= 100 and respect >= 100 and relationship >= 100))

# Reset stats to default values
func reset_stats() -> void:
	happiness = 50
	money = 50
	respect = 50
	relationship = 50
	stats_changed.emit(get_stats())
	print("Stats reset to defaults")

# Get a formatted string showing stat changes - for UI updates
func format_stat_changes(happiness_delta: int, money_delta: int, respect_delta: int, relationship_delta: int) -> String:
	var changes: Array[String] = []
	
	if happiness_delta != 0:
		changes.append("Happiness %s%d" % ["+" if happiness_delta > 0 else "", happiness_delta])
	if money_delta != 0:
		changes.append("Money %s%d" % ["+" if money_delta > 0 else "", money_delta])
	if respect_delta != 0:
		changes.append("Respect %s%d" % ["+" if respect_delta > 0 else "", respect_delta])
	if relationship_delta != 0:
		changes.append("Relationship %s%d" % ["+" if relationship_delta > 0 else "", relationship_delta])
	
	return ", ".join(changes)
