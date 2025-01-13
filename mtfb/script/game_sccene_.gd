extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("timeline")


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_dialogic_signal(argument):
	if argument is String:
		if argument == "date_end":
			_on_button_date_date_end()
		if argument == "its signal":
			print("a signal war")


func _on_button_date_date_start() -> void:
	$SubjectCanvas/LayoutBottoni.visible = false
	$SubjectCanvas/ButtonMerge.visible = false
	$SubjectCanvas/ButtonDate.visible = false
	for tipa in $SubjectCanvas/LayoutTipe/HBoxContainer.get_children():
		if tipa != Globals.current_subject:
			tipa.visible = false
			


func _on_button_date_date_end() -> void:
	$SubjectCanvas/LayoutBottoni.visible = true
	$SubjectCanvas/ButtonMerge.visible = true
	$SubjectCanvas/ButtonDate.visible = true
	for tipa in $SubjectCanvas/LayoutTipe/HBoxContainer.get_children():
		tipa.visible = true
	Globals.dating = false
	Globals.current_subject.connect_dialogic(false)
