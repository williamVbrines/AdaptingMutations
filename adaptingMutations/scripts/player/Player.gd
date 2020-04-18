extends KinematicBody2D

onready var animation = $Anim
const WALK_SPEED = 5;
var faceing : int = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var xa = 0;
	var ya = 0;
	
	if(Input.is_action_pressed("ui_down")):
		ya += 1;
		faceing = 1;
		
	if(Input.is_action_pressed("ui_left")):
		xa -= 1;
		
	if(Input.is_action_pressed("ui_right")):
		xa += 1;
		
	if(Input.is_action_pressed("ui_up")):
		ya -= 1;
		faceing = -1;
		
	if(xa != 0 || ya != 0):
		if(faceing != 0):
			animation.walk(faceing)
	else:
		animation.walk(0)
	
	move_and_collide(Vector2(WALK_SPEED * xa, WALK_SPEED * ya));