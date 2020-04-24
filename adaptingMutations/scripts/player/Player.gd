extends KinematicBody2D

onready var animation = $Anim
onready var body = $Sprite
onready var sceenchange = $Camera2D/SceneChanger;

onready var health_bar = $Camera2D/Health;

const Normal_WALK_SPEED = 300
var WALK_SPEED = 300;

var health = 10;
var max_health = 10; 

var move = Vector2(0,0)
var faceing : int = 0;
const center : Vector2 = Vector2(0,-22.5);

var _follow : bool = false;

var wepon : Wepon;


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true);
	animation.init(body);

func _process(_delta):
	var angle = 0;
	faceing = 1;
	
	if(_follow == true):
		angle = position + center;
		angle = (angle.angle_to_point(get_global_mouse_position())) - PI;
		move = Vector2(WALK_SPEED * cos(angle), WALK_SPEED * sin(angle))
		move = move_and_slide(move);
		
		if(move.y > 0):
			faceing = 1;
		else:
			faceing = -1;
		
		if(faceing != 0):
			animation.walk(faceing)
			
	else:
		animation.walk(0)
	
func _on_HitBox_area_entered(area):
	if(area is Node):
		if(area.name == "Attack"):
			animation.hit();
			health -= area.get_damage();
			if(health > 0):
				
				health_bar.set_health(health/max_health);
			else:
				health_bar.set_health(0.0001);
				sceenchange.change_scene("res://scripts/GameOver/GameOver.tscn")

func goto_main():
	sceenchange.change_scene("res://scripts/main/Main.tscn")

func drop_wepon(new_wepon : Wepon = null):
	
	if(wepon != null):
		wepon.drop();
		
	if(new_wepon != null):
		wepon = new_wepon;


func _on_DeadZone_mouse_entered():
	_follow = false;
	
func _on_DeadZone_mouse_exited():
	_follow = true;
