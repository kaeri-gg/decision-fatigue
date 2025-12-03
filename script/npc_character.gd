class_name NPC
extends Sprite2D

const OFFSET = 400
var animateToPositionX: float
var animateFromPositionX: float

func _ready() -> void:
	animateToPositionX = self.position.x
	# Change offset to make sure it is hidden from viewport
	animateFromPositionX = animateToPositionX - OFFSET
	# Just update with no animation, set on the right hidden
	self.position.x = animateFromPositionX

func slide_in():
	await utils.slide_in(self, animateToPositionX)

func slide_out():
	await utils.slide_in(self, animateFromPositionX)
