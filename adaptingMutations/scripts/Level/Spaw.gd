extends Node2D

onready var zom = load("res://scripts/monsters/zom/Zom.tscn");
onready var ice = load("res://scripts/monsters/iceScream/iceScream.tscn");
onready var pop = load("res://scripts/monsters/Poptart/Poptart.tscn");
onready var mush = load("res://scripts/monsters/MushMellow/MushMellow.tscn");

func spawn(val):
	
	var ran = randi();
	var new = null;
	match (ran%3):
		0:
			new = zom.instance();
		1:
			new = zom.instance();
		2:
			new = pop.instance();
		3:
			new = ice.instance();
	new.position = val;
	get_parent().add_child(new);
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func respaw():
	for i in get_child_count()-1:
		spawn(get_child(i).position);

