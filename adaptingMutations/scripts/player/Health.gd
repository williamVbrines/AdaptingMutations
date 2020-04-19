extends Sprite

onready var bar = $Sprite3/HealthBar;
var ogScale = 0; 

func _ready():
	ogScale = bar.scale.x;
	
func set_health(value : float):
	bar.scale.x = ogScale*value;
