extends KinematicBody2D

onready var animation = $Anim
onready var body = $Sprite
const WALK_SPEED = 250;
var faceing : int = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.init(body);

func _process(_delta):
	var xa = 0;
	var ya = 0;
	faceing = 1;
	
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
	
# warning-ignore:return_value_discarded
	move_and_slide(Vector2(WALK_SPEED * xa, WALK_SPEED * ya));
