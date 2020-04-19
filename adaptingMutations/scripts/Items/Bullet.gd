extends Wepon
var damage : int = 1;
var velocity : Vector2 = Vector2(0,0);

func _process(delta):
	position += velocity * delta;
	
func set_velocity(vel : Vector2):
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
	
