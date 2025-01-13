extends Node

signal id_selected
signal merge_update(stat_name: String, amount: int)

var merging: bool = false
var current_subject : Subject:
	set(value):
		current_subject = value
		print(current_subject)
		id_selected.emit()
var current_button: ButtonId:
	set(value):
		current_button = value
		print(current_button)

var dating: bool = false
