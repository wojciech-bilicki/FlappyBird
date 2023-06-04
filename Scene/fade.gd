extends Node

class_name Fade

@onready var animation_player = $AnimationPlayer

func play():
	animation_player.play("fade")


func _on_animation_player_animation_finished(anim_name):
	queue_free()
