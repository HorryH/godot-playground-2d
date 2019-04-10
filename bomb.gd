extends RigidBody2D

var new_position = null

func set_position(position):
	new_position = position

func _physics_process(delta):
	var bomb_pressed = Input.is_action_pressed("bomb")
	if bomb_pressed:
		set_position(Vector2(20, 300))
		
func _integrate_forces(state):	
	if new_position:
		var transform = state.get_transform()
		transform.origin.x = new_position.x
		transform.origin.y = new_position.y
		state.set_transform(transform)
		new_position = null
		