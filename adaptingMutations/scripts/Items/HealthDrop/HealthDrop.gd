extends Wepon

onready var _anim = $Anim
onready var sprite = $Sprite; 
onready var sprite_stored = $Stored; 
export var health_res : int = 1;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	if(_using):
		if(Input.is_action_just_pressed("ui_accept")):
			_attack(true);
			
		elif(Input.is_action_just_released("ui_accept")):
			_attack(false);
		
func _attack(tof : bool):
	_anim.attack(tof);
	
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

func stored():
	sprite_stored.visible = true;
	sprite.visible = false;
	_attack(false);

	
func un_store():
	sprite_stored.visible = false;
	sprite.visible = true;
