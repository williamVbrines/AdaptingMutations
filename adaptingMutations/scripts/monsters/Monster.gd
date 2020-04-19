extends KinematicBody2D;

class_name Monster

export var health : int = 1;
export var damage : int = 1;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _take_damage(value : int):
	health -= value;
	if(health < 0):
		queue_free();
		
func get_damage():
	return damage;
