class_name Subject
extends Control


@export var stats : Stats
#@export var selected: bool = false

func _ready() -> void:
	Globals.connect("merge_update", update_stats)
	update_stats("Survival", 0)
	update_stats("Boobs", 0)
	update_stats("Ass", 0)
	update_stats("Eyes", 0)
	update_stats("Skinnyness", 0)
	#if selected:
		#Dialogic.signal_event.connect(_on_dialogic_signal)
	#else:
		#Dialogic.signal_event.disconnect(_on_dialogic_signal)

func connect_dialogic(connected: bool):
	if connected == true:
		Dialogic.signal_event.connect(_on_dialogic_signal)
	else:
		Dialogic.signal_event.disconnect(_on_dialogic_signal)

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
			if stats.Boobs <= 2:
				$TextureRect/Boobs/BoobsAnim.play("minimum booba")
			elif stats.Boobs > 2 and stats.Boobs <= 4: 
				$TextureRect/Boobs/BoobsAnim.play("medium boobs")
			elif stats.Boobs > 4 and stats.Boobs <= 6: 
				$TextureRect/Boobs/BoobsAnim.play("Big Boobs")
			elif stats.Boobs > 6 and stats.Boobs <= 8: 
				$TextureRect/Boobs/BoobsAnim.play("Biggest Boobs")
			elif stats.Boobs > 8 and stats.Boobs <= 10: 
				$TextureRect/Boobs/BoobsAnim.play("MAXIMUM BOOBS")
		"Ass":
			stats.Ass += amount
		"Eyes":
			stats.Eyes += amount
			if stats.Eyes <= 2:
				$TextureRect/Face/FaceAnim.play("Mini Eyes")
			elif stats.Eyes > 2 and stats.Eyes <= 4: 
				$TextureRect/Face/FaceAnim.play("Medium Eyes")
			elif stats.Eyes > 4 and stats.Eyes <= 6: 
				$TextureRect/Face/FaceAnim.play("Big Eyes")
			elif stats.Eyes > 6 and stats.Eyes <= 8: 
				$TextureRect/Face/FaceAnim.play("Biggest Eyes")
			elif stats.Eyes > 8 and stats.Eyes <= 10: 
				$TextureRect/Face/FaceAnim.play("MAXIMUM Eyes")
		"Skinnyness":
			stats.Skinnyness += amount
			if stats.Eyes <= 2:
				$TextureRect/Skinny/SkinnyAnim.play("Minimum Skinny")
			elif stats.Skinnyness > 2 and stats.Skinnyness <= 4:
				$TextureRect/Skinny/SkinnyAnim.play("Medium Skinny")
			elif stats.Skinnyness > 4 and stats.Skinnyness <= 6:
				$TextureRect/Skinny/SkinnyAnim.play("Big Skinny")
			elif stats.Skinnyness > 6 and stats.Skinnyness <= 8:
				$TextureRect/Skinny/SkinnyAnim.play("Biggest Skinny")
			elif stats.Skinnyness > 8 and stats.Skinnyness <= 10:
				$TextureRect/Skinny/SkinnyAnim.play("Maximum Skinny")
		_:
			print("Invalid stat_name: " + str(stat_name))
