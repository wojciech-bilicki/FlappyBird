extends Node2D

class_name Ground

signal bird_crashed

var speed = -150

@onready var sprite1 = $Ground1/Sprite1
@onready var sprite2 = $Ground2/Sprite2

func _ready():
	sprite2.global_position.x = sprite1.global_position.x + sprite1.texture.get_width()

func _process(delta):
	sprite1.global_position.x += speed * delta
	sprite2.global_position.x += speed * delta
	
	# If Sprite1 has completely left the screen, move it to the right of Sprite2
	if sprite1.global_position.x < -sprite1.texture.get_width():
		sprite1.global_position.x = sprite2.global_position.x + sprite2.texture.get_width()

	# If Sprite2 has completely left the screen, move it to the right of Sprite1
	if sprite2.global_position.x < -sprite2.texture.get_width():
		sprite2.global_position.x = sprite1.global_position.x + sprite1.texture.get_width()


func _body_entered(body):
	bird_crashed.emit()
	(body as Bird).stop()
	
func stop():
	speed = 0#
