extends CharacterBody2D

@onready var flash_sprite: Sprite2D = $FlashSprite
@onready var sprite: AnimatedSprite2D = $Sprite


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction := 0
func _ready() -> void:
	Utility.player_pos = position

func _physics_process(delta: float) -> void:
	spriteDirection()
	flashlight()
	# Needed to allow other nodes to know the player's position
	Utility.player_pos = position 
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	
	move_and_slide()

func spriteDirection():
	if get_local_mouse_position().x > sprite.position.x:
		sprite.flip_h = false
	elif get_local_mouse_position().x < sprite.position.x:
		sprite.flip_h = true

func flashlight():
	flash_sprite.look_at(get_global_mouse_position())
	if sprite.flip_h == false:
		flash_sprite.position.x = sprite.position.x + 65
		flash_sprite.rotation_degrees = clamp(flash_sprite.rotation_degrees,-40,40)
	elif sprite.flip_h == true:
		flash_sprite.position.x = sprite.position.x - 65
		flash_sprite.rotation_degrees = clamp(flash_sprite.rotation_degrees,140,230)
		
	
