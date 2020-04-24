extends Wepon

onready var _anim = $Anim
onready var sprite = $Sprite; 
onready var sprite_stored = $Stored; 
export var health_res : int = 1;
# Called when the node enters the scene tree for the first time.
func _ready():
	_able_to_pick_up = false;
	pass # Replace with function body.
		
func _attack(tof : bool):
	_anim.attack(tof);
	
func _pick_up_area_entered(area):
	if(area is Node2D):
		if(area.name == "Player"):
			_able_to_pick_up = false;
			_player = area;
			_using = true;
			shoot()
			
func shoot():
	if(_using == true):
		if(_player.health + health_res <= _player.max_health):
			_player.health += health_res;
			_player.health_bar.set_health(_player.health/_player.max_health);
			_player.using_wepon = false
			queue_free();
		elif(_player.health != _player.max_health):
			_player.health = _player.max_health
			_player.health_bar.set_health(_player.health/_player.max_health);
			_player.using_wepon = false
			queue_free();
