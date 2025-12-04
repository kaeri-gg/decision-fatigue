class_name Player
extends Sprite2D

@onready var player_mood: Player = %PlayerMood

const OFFSET: int = 400
var animateToPositionX: float
var animateFromPositionX: float

var mood_happy: Resource
var mood_neutral: Resource
var mood_stress: Resource
var mood_annoyed: Resource
var mood_sad: Resource

func _ready() -> void:
	animateToPositionX = self.position.x
	# Change offset to make sure it is hidden from viewport
	animateFromPositionX = animateToPositionX + OFFSET
	# Just update with no animation, set on the right hidden
	self.position.x = animateFromPositionX
	
	mood_happy = load("res://assets/images/characters/characters_mood-happy.png")
	mood_annoyed = load("res://assets/images/characters/characters_mood-annoyed.png")
	mood_neutral = load("res://assets/images/characters/characters_mood-neutral.png")
	mood_stress = load("res://assets/images/characters/characters_mood-stress.png")
	mood_sad = load("res://assets/images/characters/characters_mood-sad.png")

func update_mood_by(happiness: int) -> void:
	player_mood.texture = mood_happy
	
	if happiness <= 50:
		player_mood.texture = mood_neutral
	if happiness <= 42:
		player_mood.texture = mood_annoyed
	if happiness <= 35:
		player_mood.texture = mood_sad
	if happiness <= 15:
		player_mood.texture = mood_stress

func slide_in():
	await utils.slide_in(self, animateToPositionX)

func slide_out():
	await utils.slide_in(self, animateFromPositionX)
