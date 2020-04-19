extends Wepon
var damage : int = 1;
var velocity : Vector2 = Vector2(0,0);
export var max_distance : float = 50;
var orgin : Vector2 = Vector2(0,0);

func _process(delta):
	if(position.distance_to(orgin) > max_distance):
		queue_free();
	position += velocity * delta;
	
func set_velocity(vel : Vector2, org : Vector2):
	orgin = org;
	velocity = vel;
	
func set_damage(dam : int):
	damage = dam;
	
func _get_damage() -> int:
	return damage;

func _on_Bullet_body_entered(body):
	if(body is Monster):
		body._take_damage(damage)
		queue_free();
	if(body is Node2D):
		if(body.name == "TileMap"):
			queue_free();
#		else:
#			print(body.name)

func _on_Bullet_area_entered(area):
	if(area is Monster):
		area._take_damage(damage)
		queue_free();
	if(area is Node2D):
		if(area.name == "TileMap"):
			queue_free();
#		else:
#			print(area.name)
	
