extends Node2D

onready var zom = load("res://scripts/monsters/zom/Zom.tscn");
onready var spawn = $StartSpawn
onready var nav = $Navigation2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var new_zom = zom.instance();
	new_zom.position = spawn.position;
	new_zom.nav = nav;
	add_child(new_zom);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
