extends Node2D

class_name Spawner

export var max_spawn = 3;
var _spawed = 0;
onready var zom = load("res://scripts/monsters/zom/Zom.tscn");
onready var pop = load("res://scripts/monsters/Poptart/Poptart.tscn");
onready var mush = load("res://scripts/monsters/MushMellow/MushMellow.tscn");
onready var ice = load("res://scripts/monsters/iceScream/iceScream.tscn");
	
var can_spawn : bool = true;
onready var spawn_area = $Area2D;
onready var timer = $Timer;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func freed_monster():
	if(_spawed > 0):
		_spawed -= 1;

func _on_Timer_timeout():
	_spawn_monster();
	timer.start();
	pass

func _spawn_monster():
	if(spawn_area.get_overlapping_bodies().size() <= 1):
		var ran = randi();
		var new_mon = zom.instance();
		
		match(ran%4):
			0:
				new_mon = zom.instance();
			1:
				new_mon = pop.instance();
			2:
				new_mon = ice.instance();
			3:
				new_mon = mush.instance();
		
		new_mon.nav = get_parent().get_map();
		new_mon.position = position;
		get_parent().add_child(new_mon);
	

func _on_Area2D_body_entered(body):
	pass

func _on_Area2D_body_exited(body):
	pass

