extends CharacterBody2D

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_player_front: RayCast2D = $RayCastPlayerFront
@onready var ray_cast_player_back: RayCast2D = $RayCastPlayerBack

const SPEED := 300.0
var direction := 1
var player_found := false

func _physics_process(delta: float) -> void:
	if player_found:
		chase()
	else:
		patrol()
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		
		
	move_and_slide()



func patrol():
	if ray_cast_right.is_colliding():
		direction = -1
		ray_cast_player_front.rotate(rad_to_deg(180))
		ray_cast_player_back.rotate(rad_to_deg(180))
	elif ray_cast_left.is_colliding():
		direction = 1
		ray_cast_player_front.rotate(rad_to_deg(180))
		ray_cast_player_back.rotate(rad_to_deg(180))
	if ray_cast_player_front.is_colliding() or ray_cast_player_back.is_colliding():
		player_found = true
		
		
	velocity.x = direction * SPEED
	
func chase():
	
	if Utility.player_pos.x > position.x:
		direction = 1
	elif Utility.player_pos.x < position.x:
		direction = -1
		
	velocity.x = direction * SPEED * 1.1
	
	#the plan for this function is to uses an autoload to find the players position
	#and have the enemy run at them
	
