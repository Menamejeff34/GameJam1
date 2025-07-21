extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer



func _ready() -> void:
	animation_player.play("Fade Out")


func _on_quit_button_pressed() -> void:
	animation_player.play("Fade In")
	var timer = get_tree().create_timer(1)
	await timer.timeout
	get_tree().quit()
