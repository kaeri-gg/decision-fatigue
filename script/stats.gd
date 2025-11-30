class_name Stats
extends VBoxContainer

@onready var happiness_point: Label = %HappinessPoint
@onready var money_point: Label = %MoneyPoint
@onready var respect_point: Label = %RespectPoint
@onready var relationship_point: Label = %RelationshipPoint

@onready var happiness_bar: ProgressBar = %HappinessBar
@onready var money_bar: ProgressBar = %MoneyBar
@onready var respect_bar: ProgressBar = %RespectBar
@onready var relationship_bar: ProgressBar = %RelationshipBar

const GAINED_STATS = preload("res://themes/stats/gained_stats.tres")
const REDUCED_STATS = preload("res://themes/stats/reduced_stats.tres")
const DEFAULT_STATS = preload("res://themes/stats/default_stats.tres")

const delay : int = 7

func update(changed_stats: Dictionary, global_stats: Dictionary) -> void:
	update_happiness(changed_stats)
	update_money(changed_stats)
	update_respect(changed_stats)
	update_relationship(changed_stats)
	
	await utils.fade_in(self)
	await utils.timeout(delay)
	await utils.fade_out(self)
	
	update_bars(global_stats)

func update_happiness(changed_stats: Dictionary) -> void :
	happiness_point.text = format( changed_stats.get('happiness'), happiness_point)
	
func update_money(changed_stats: Dictionary) -> void :
	money_point.text = format(changed_stats.get('money'), money_point)
	
func update_respect(changed_stats: Dictionary) -> void :
	respect_point.text = format(changed_stats.get('respect'), respect_point)
	
func update_relationship(changed_stats: Dictionary) -> void :
	relationship_point.text = format(changed_stats.get('relationship'), relationship_point)

func update_bars(global_stats: Dictionary) -> void:
	happiness_bar.value = global_stats.get('happiness')
	money_bar.value = global_stats.get('money')
	respect_bar.value = global_stats.get('respect')
	relationship_bar.value = global_stats.get('relationship')

func format(text: Variant, label: Label) -> String:
	if int(text) > 0:
		label.set_theme(GAINED_STATS)
		return "+" + str(text)
	elif int(text) == 0:
		label.set_theme(DEFAULT_STATS)
		return "+" + str(text)
	
	label.set_theme(REDUCED_STATS)	
	return str(text)
