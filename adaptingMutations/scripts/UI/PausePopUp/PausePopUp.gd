extends Node2D

onready var pause = $Pause;
onready var play = $Play;
onready var exit = $Exit;
onready var changer = $SceneChanger;

func _ready():
	play.disabled = true;
	play.visible = false;
	pause.disabled = false;
	pause.visible = true;
	exit.disabled = true;
	exit.visible = false;
	
func _on_Pause_pressed():
	get_tree().paused = true;
	play.disabled = false;
	play.visible = true;
	exit.disabled = false;
	exit.visible = true;
	pause.disabled = true;
	pause.visible = false;


func _on_Play_pressed():
	get_tree().paused = false;
	play.disabled = true;
	play.visible = false;
	pause.disabled = false;
	pause.visible = true;
	exit.disabled = true;
	exit.visible = false;
	

func _on_Exit_pressed():
	get_tree().paused = false;
	changer.change_scene("res://scripts/main/Main.tscn");

