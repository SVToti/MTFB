class_name ButtonId

extends Control

@export var button_subject: Subject

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_button_pressed() -> void:
	Globals.current_button = self
	Globals.current_subject = button_subject
