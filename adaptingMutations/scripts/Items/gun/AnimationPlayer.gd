extends AnimationPlayer

var attacking = false;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func attack(tof : bool):
	if(tof == false):
		attacking = false;
	else:
		if(attacking == false) :
			play("Attack");
			attacking = true;

func _on_AnimationPlayer_animation_finished(anim_name):
	match (anim_name):
		"Attack": 
			if(attacking == true):
				play("Attack");
