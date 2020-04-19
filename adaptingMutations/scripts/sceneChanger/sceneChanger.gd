###############################################################################
#Author William Brines
#This file is here to help manage the transitions between scenes
###############################################################################
extends Node

onready var _anim = $FadeAnimation
onready var _fade = $Control/Fade

#onready var fade = $Control/Fade;
signal scene_changed;

#############################################################################
#Changes the scene and fades in then out of black
#############################################################################
func change_scene(path, delay : float = 00.5):
	
	yield(get_tree().create_timer(delay) , "timeout");#Delay the animation
	
	_fade.show()
	_anim.play("fade_black");#Play the fadinging animation
	yield(_anim, "animation_finished");#Wait for the animation to be finished
	
	assert(get_tree().change_scene(path) == OK);#Change the scene
	
	
	_anim.play_backwards("fade_black");#Play the animation to fade in the scene
	yield(_anim, "animation_finished");#Wait for the animation to be finished
	
	emit_signal("scene_changed");#Tell the godot that the scene has changed
	
	_fade.hide()
