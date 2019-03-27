extends Node2D


func _on_princess_body_enter(body):
	# The name of this editor-generated callback is unfortunate
	if body.get_name() == "player":
		$youwin.show()
	
func _physics_process(delta):
	var cheat = Input.is_action_pressed("cheat")
	if cheat:
		$player.set_position(Vector2(45, 80))

func _on_view_area_body_exited(body):
	var viewport = get_viewport()
	if body.position.x < 0:
		body.set_position(Vector2(viewport.size.x, body.position.y))
	elif body.position.x > viewport.size.x:
		body.set_position(Vector2(0, body.position.y))
	elif body.position.y > viewport.size.y:
		body.set_position(Vector2(body.position.x, 0))