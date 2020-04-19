extends TextureButton

onready var anim = $AnimationPlayer;
var swiching = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.





func _on_Play_pressed():
	if(swiching == false):
		anim.play("jgel");
		swiching = true;
