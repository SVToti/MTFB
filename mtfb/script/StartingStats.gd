class_name Stats

extends Resource

@export var Survival: int = 10:
	set(value):
		Survival = clamp(value, 0 , 10)
@export var Boobs: int = 1:
	set(value):
		Boobs = clamp(value, 1 , 10)
@export var Ass: int = 1:
	set(value):
		Ass = clamp(value, 1 , 10)
@export var Eyes: int = 1:
	set(value):
		Eyes = clamp(value, 1 , 10)
@export var Skinnyness: int = 1:
	set(value):
		Skinnyness = clamp(value, 1 , 10)
