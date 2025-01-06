class_name Subject
extends Control


@export var stats : Stats
@export var selected: bool = false

func _ready() -> void:
	if selected:
		Dialogic.signal_event.connect(_on_dialogic_signal)
	#else:
		#Dialogic.signal_event.disconnect(_on_dialogic_signal)

func _on_dialogic_signal(argument):
	if argument is Dictionary:
		if argument.signal_name == "modify_stats":
			update_stats(argument.stat_name, argument.amount)

func load_stats (subj_stats: Stats) -> void:
	stats = subj_stats 

func update_stats (stat_name: String, amount: int) -> void:
	match stat_name:
		"Survival":
			stats.Survival += amount
			if stats.Survival <= 2:
				print("SHE'S CRAAAZYYY")
		"Boobs":
			stats.Boobs += amount
		"Ass":
			stats.Ass += amount
		"Eyes":
			stats.Eyes += amount
		"Skinnyness":
			stats.Skinnyness += amount
		_:
			print("Invalid stat_name: " + str(stat_name))
