extends Area2D

@onready var sfx: AudioStreamPlayer2D = $SFX


func _on_body_entered(body: Node2D) -> void:
	sfx.play()
	var timer = get_tree().create_timer(0.4)
	await timer.timeout
	Utility.player_has_flashlight = true
	get_tree().queue_delete(self)
