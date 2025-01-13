extends Control

signal date_start
signal date_end

func _ready() -> void:
	Globals.connect("id_selected", get_dating_subject)

func _on_button_pressed() -> void:
	if Globals.merging == false:
		Globals.dating = not Globals.dating

func get_dating_subject():
	if Globals.dating == true:
		Globals.current_subject.connect_dialogic(true)
		date_start.emit()
		Dialogic.start("Date_Jack")
