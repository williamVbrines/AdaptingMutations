extends Area2D

class_name Wepon 

var _player : Node2D = null;

var _able_to_pick_up : bool = false

var _using : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	if(_using && _player != null):
		position = _player.position + _player.center;
		rotation = (_player.position.angle_to_point(get_global_mouse_position())) - PI;

func _input(event):
	if(event.is_action_pressed("ui_select")):
		if(_player != null):
			if(_able_to_pick_up == true):
				if(!_player.using_wepon):
					_using = true;
					_able_to_pick_up = false;
					_player.using_wepon = true;
			elif(_using):
				position = _player.position;
				_able_to_pick_up = true;
				_using = false;
				_player.using_wepon = false;
		
func _attack(_value):
	pass
	
func _get_damage() -> int:
	return 0;

func _pick_up_area_exited(body):
	if(!_using):
		if(body is Node2D):
			if(body.name == "Player"):
				_able_to_pick_up = false;


func _pick_up_area_entered(body):
	if(!_using):
		if(body is Node2D):
			if(body.name == "Player"):
				_player = body;
				_able_to_pick_up = true;
	
