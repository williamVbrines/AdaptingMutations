extends AnimationPlayer

var walking : int = 0;
var _body : Sprite;
var _hit : bool = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func init(body):
	_body = body;
	
func hit():
	if(_hit == false):
			play("Hit");
			_hit = true;
			walking = -2;
	
func walk(dir : int = 0):
	if(walking != -2):
		if(walking != 0 && dir != walking) :
			if(dir == 1):
				play("Walk_down");
			if(dir == -1):
				play("Walk_up");
				
		if(walking == 0):
			if(dir == 1):
				play("Walk_down");
			if(dir == -1):
				play("Walk_up");
		walking = dir;


func _on_Anim_animation_finished(anim_name):
	match (anim_name):
		"Walk_down": 
			if(walking == 1):
				play("Walk_down");
			if(walking == -1):
				play("Walk_up");
			if(walking == 0):
				_body.flip_h = false;
				_body.frame = 0;
				_body.rotation = 0.0;
				_body.offset = Vector2(10,-16);
				
		"Walk_up":
			if(walking == 1):
				play("Walk_down");
			if(walking == -1):
				play("Walk_up");
			if(walking == 0):
				_body.flip_h = false;
				_body.offset = Vector2(10,-16);
				_body.frame = 1;
				_body.rotation = 0.0;
		"Hit":
			_hit = false;
			walking = 0;
