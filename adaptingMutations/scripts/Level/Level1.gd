extends Node2D

onready var zom = load("res://scripts/monsters/zom/Zom.tscn");
onready var nav = $Navigation2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_map() -> Navigation2D:
	return nav;
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
