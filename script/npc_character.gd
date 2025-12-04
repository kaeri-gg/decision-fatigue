class_name NPC
extends Sprite2D

@onready var npc_character: NPC = %NPCCharacter

const OFFSET = 400
var animateToPositionX: float
var animateFromPositionX: float

var characters: Dictionary[String, Resource]
	
func _ready() -> void:
	animateToPositionX = self.position.x
	# Change offset to make sure it is hidden from viewport
	animateFromPositionX = animateToPositionX - OFFSET
	# Just update with no animation, set on the right hidden
	self.position.x = animateFromPositionX
	
	characters = {
		"Family": load("res://assets/images/characters/characters_npc-relative-male.png"),
		"Relatives": load("res://assets/images/characters/characters_npc-relative-female.png"),
		"Neighbors": load("res://assets/images/characters/characters_npc-neighbor-07.png"),
		"Friends' Drama": load("res://assets/images/characters/characters_npc-friend-2.png"),
		"Work": load("res://assets/images/characters/characters_npc-work-2.png"),
		"Parenting": load("res://assets/images/characters/characters_npc-kid-2.png"),
		"Ranting": load("res://assets/images/characters/characters_npc-friend.png"),
		"Accusations": load("res://assets/images/characters/characters_npc-work.png"),
		"Household": load("res://assets/images/characters/characters_npc-neighbor-12.png"),
		"Health": load("res://assets/images/characters/characters_npc-work.png"),
		"In-Laws": load("res://assets/images/characters/characters_npc-neighbor-07.png"),
		"Random Emergencies": load("res://assets/images/characters/characters_npc-neighbor.png"),
		"Transportation": load("res://assets/images/characters/characters_npc-work.png"),
		"Social Obligations": load("res://assets/images/characters/characters_npc-neighbor-07.png"),
		"Chores": load("res://assets/images/characters/characters_npc-kid-2.png"),
		"Personal Development": load("res://assets/images/characters/characters_npc-work.png"),
	}

func update_character_by(topic: String) -> void:
	npc_character.texture = characters.get(topic)

func slide_in():
	await utils.slide_in_x(self, animateToPositionX)

func slide_out():
	await utils.slide_in_x(self, animateFromPositionX)
