extends KinematicBody2D;

class_name Monster

export var health : int = 1;
export var damage : int = 1;
export var attack_damage : float = 1;

export var WALK_SPEED = 50;

var nav = null;

var dir = Vector2(0,0);
var nav_map = null;
# Called when the node enters the scene tree for the first time.
	
func update_nav(nav : Navigation2D, target : Node2D):
#	nav_map = nav.get_closest_point()position,target.position,false);
	if(nav != null):
		nav_map = nav.get_simple_path(position + Vector2(0,-22.5),target.position)
		nav_map.remove(0)
		if(nav_map.size() == 0):
			queue_free();
	else:
		nav = get_parent().get_map();
		
func _take_damage(value : int):
	health -= value;
	if(health < 0):
		queue_free();
		
func get_damage() -> float:
	return attack_damage;

#func _exit_tree():
#	if(get_parent() is Spawner):
#		get_parent().freed_monster();
