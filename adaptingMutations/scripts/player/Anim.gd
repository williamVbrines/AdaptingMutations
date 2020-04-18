extends AnimationPlayer

var walking : int = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func walk(dir : int = 0):
	
	if(walking != 0 && dir != walking) :
		if(dir == 1):
			play("Walk_down");
		if(dir == -1):
			play("Wlak_up");
			
	
	if(walking == 0):
		if(dir == 1):
			play("Walk_down");
		if(dir == -1):
			play("Wlak_up");
	walking = dir;


func _on_Anim_animation_finished(anim_name):
	match (anim_name):
		"Walk_down": 
			if(walking == 1):
				play("Walk_down");
			if(walking == -1):
				play("Wlak_up");
	
		"Walk_up":
			if(walking == 1):
				play("Walk_down");
			if(walking == -1):
				play("Wlak_up");

	pass # Replace with function body.
