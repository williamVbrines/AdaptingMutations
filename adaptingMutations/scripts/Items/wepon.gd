extends Area2D

class_name Wepon 

var _player : Node2D = null;

var _able_to_pick_up : bool = true;

var _using : bool = false
var offset : Vector2 = Vector2(0,0);

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	if(_using && _player != null):
		position = _player.position + _player.center;
		var angle = _player.position + _player.center;
		angle = (angle.angle_to_point(get_global_mouse_position())) - PI;
	
		rotation = angle

func _attack(_value):
	pass
	
func _get_damage() -> int:
	return 0;

func _pick_up_area_exited(body):
	if(!_using):
		if(body is Node2D):
			if(body.name == "Player"):
				_able_to_pick_up = true;

func drop():
	_using = false;
	_able_to_pick_up = false;


func _pick_up_area_entered(body):
	if(!_using):
		if(body is Node2D):
			if(body.name == "Player"):
				if(_able_to_pick_up):
					_player = body;
					_player.drop_wepon(self)
					_using = true;
					_able_to_pick_up = false;
	
