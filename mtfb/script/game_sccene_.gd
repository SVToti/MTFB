extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("timeline")


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_dialogic_signal(argument: String):
	if argument == "its signal":
		print("a signal war")
