extends Node2D

onready var sceneChanger = $SceneChanger

func _on_AnimationPlayer_animation_finished(anim_name):
	sceneChanger.change_scene("res://scripts/Level/Level1.tscn", 1)
	pass # Replace with function body.
