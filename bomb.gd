extends RigidBody2D

var new_position = null
onready var player = get_node("../../colworld/player")

func set_position(position):
	new_position = position

func _physics_process(delta):
	var bomb_pressed = Input.is_action_pressed("bomb")
	if bomb_pressed:
		set_position(player.position)
		apply_central_impulse(player.throw_impulse())
		
func _integrate_forces(state):	
	if new_position:
		var transform = state.get_transform() 
		transform.origin.x = new_position.x
		transform.origin.y = new_position.y
		state.set_transform(transform)
		new_position = null
		