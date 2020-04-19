extends KinematicBody2D

onready var animation = $Anim
onready var body = $Sprite
const Normal_WALK_SPEED = 250;
var WALK_SPEED = 250;
var faceing : int = 0;
var center : Vector2 = Vector2(0,-22.5);
var using_wepon = false;
var health = 10;
var max_health = 10; 
onready var health_bar = $Camera2D/Health;
onready var sceenchange = $Camera2D/SceneChanger;
onready var hold = $Camera2D/Hole;

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
		
	if(Input.is_action_pressed("ui_cancel")):
		if(using_wepon):
			using_wepon = false;
		
	if(xa != 0 || ya != 0):
		if(faceing != 0):
			animation.walk(faceing)
	else:
		animation.walk(0)
	
# warning-ignore:return_value_discarded
	move_and_slide(Vector2(WALK_SPEED * xa, WALK_SPEED * ya));


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

func store() -> Vector2:
	return hold.position + position
	
