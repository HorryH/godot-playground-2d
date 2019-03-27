extends Node2D


func _on_princess_body_enter(body):
	# The name of this editor-generated callback is unfortunate
	if body.get_name() == "player":
		$youwin.show()
	
func _physics_process(delta):
	var cheat = Input.is_action_pressed("cheat")
	if cheat:
		$player.set_position(Vector2(45, 80))
	_screen_wrap($player)
	
func _screen_wrap(entity):
	# print(entity.position.x)
	pass