extends Monster

onready var animation = $Anim
onready var _body = $Sprite
var faceing : int = 0;
var following : bool = false;
var attacking : bool = false;
var move = Vector2(0,0)

var _player = null;

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.init(_body);

func _process(delta):
	
	var dir = Vector2(0,0);
	if(attacking):
		attack();
	if(!animation.attacking):
		if(animation._hit == false):
			if(_player != null && following == true):
				dir = _go_to_target(_player, delta);
				
			faceing = 1;
			if(dir.y < 0): faceing = -1;
				
			if(dir != Vector2(0,0)):
				if(faceing != 0):
					animation.walk(faceing)
			else:
				animation.walk(0)
				animation.sit();

# warning-ignore:unused_argument
func _go_to_target(target : Vector2, delta) -> Vector2:

	var dir = position.angle_to_point(target) - PI;

	move = Vector2(WALK_SPEED * cos(dir), WALK_SPEED  * sin(dir))

# warning-ignore:return_value_discarded
	move_and_slide( Vector2( 0.0, 0.0 ) )
	move = move_and_slide(move);

			
	return Vector2(WALK_SPEED * cos(dir), WALK_SPEED  * sin(dir)).normalized();
	

func attack():
	animation.attack();

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
			attacking = true;


func _on_AtackArea_body_exited(body):
	if(body is Node2D):
		if(body.name == "Player"):
			following = true;
			attacking = false;
	
func _take_damage(value : int):
	animation.hit();
	health -= value;
	if(health < 0):
		queue_free();


func _on_NavTimer_timeout():
	if(_player != null && following == true):
		update_nav(nav, _player)
