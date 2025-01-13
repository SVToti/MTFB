extends Control

var merge_subject1: Subject = null
var merge_subject2: Subject = null
@export var ass_factor: int = 4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.connect("id_selected", get_merge_ids)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func get_merge_ids():
	if Globals.merging:
		if merge_subject1 == null:
			merge_subject1 = Globals.current_subject
		elif merge_subject2 == null:
			merge_subject2 = Globals.current_subject
		if merge_subject1 != null and merge_subject2 != null:
			if merge_subject1 == merge_subject2:
				print("Can't select the same subject twice")
			else:
				Globals.merging= false
				print("Merging subjects:" + str(merge_subject1) + " " + str(merge_subject2))
				merge(merge_subject1, merge_subject2)
			merge_subject1 = null
			merge_subject2 = null

func merge(merge_subject1: Subject, merge_subject2: Subject):
	print(merge_subject1.stats.Ass)
	if merge_subject1.stats.Survival == 0:
		merge_subject1.stats.Survival += 1
	if merge_subject2.stats.Survival == 0:
		merge_subject1.stats.Survival += 1
	Globals.merge_update.emit("Survival", 0)
	merge_subject1.stats.Boobs = merge_subject1.stats.Boobs + merge_subject2.stats.Boobs
	Globals.merge_update.emit("Boobs", 0)
	merge_subject1.stats.Ass = int((merge_subject1.stats.Ass * merge_subject2.stats.Ass) / ass_factor)
	Globals.merge_update.emit("Ass", 0)
	print(merge_subject1.stats.Ass)
	#"Eyes" somma [max10]
	#"Skinnyness" 10 - Abs(skinnyness1 - skinnyness2) [max 10]
	
	#Kill subject2
	merge_subject2.visible = false
	Globals.current_button.visible = false
	#save current button and merge_subject2 vars

#func generate_stats():
	#get merge_subject2 and randomize each stat(clamp Survival top 1,10)
	#set subject and button visible to true

func _on_button_pressed() -> void:
	if Globals.dating == false:
		Globals.merging = not Globals.merging
		if Globals.merging == false:
			merge_subject1 = null
			merge_subject2 = null
