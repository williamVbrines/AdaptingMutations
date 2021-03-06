extends Wepon

onready var _anim = $Anim
onready var sprite = $Sprite; 
onready var sprite_stored = $Stored; 
onready var _bullet_scene = load("res://scripts/Items/Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	if(_using):
		_attack(true);
	else:
		_attack(false);
		
func _attack(tof : bool):
	_anim.attack(tof);
	
func shoot():
	if(_using):
		var new_bullet = _bullet_scene.instance();
		var angle = (_player.position + _player.center);
		angle = angle.angle_to_point(get_global_mouse_position()) - PI;
		var speed = 300;
		new_bullet.position = _player.position + _player.center + Vector2(40 * cos(angle),  40* sin(angle));
		
		new_bullet.max_distance = 200;
		new_bullet.set_velocity(Vector2(speed * cos(angle),speed * sin(angle)), new_bullet.position);
		new_bullet.set_damage(1);
		
	
		
		get_parent().add_child(new_bullet);

