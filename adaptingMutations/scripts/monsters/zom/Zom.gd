extends Area2D

onready var animation = $Anim
onready var body = $Sprite
const WALK_SPEED = 50;
var faceing : int = 0;
var following : bool = false;

var _player = null;

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.init(body);

func _process(delta):
	
	var dir = Vector2(0,0);
	
	if(_player != null && following == true):
		dir = _go_to_target(_player, delta);
		
	faceing = 1;
	if(dir.y < 0): faceing = -1;
		
	if(dir != Vector2(0,0)):
		if(faceing != 0):
			animation.walk(faceing)
	else:
		animation.walk(0)
	

func _go_to_target(target, delta) -> Vector2:
	var dir : Vector2 = _player.position - position;
	dir = dir.normalized()
	position += Vector2(WALK_SPEED * delta * cos(dir.angle()), WALK_SPEED *  delta * sin(dir.angle()))

	return dir;

func _on_FollowArea_body_entered(body):
	if(body is Node2D):
		if(body.name == "Player"):
			_player = body;
			following = true;
	


func _on_FollowArea_body_exited(body):
	if(body is Node2D):
		if(body.name == "Player"):
			_player = null;
			following = false;


func _on_AtackArea_body_entered(body):
	if(body is Node2D):
		if(body.name == "Player"):
			following = false;


func _on_AtackArea_body_exited(body):
	if(body is Node2D):
		if(body.name == "Player"):
			following = true;
	