extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var start_button: Button = $"Control/VBoxContainer/Start Button"
@onready var options_button: Button = $"Control/VBoxContainer/Options Button"
@onready var quit_button: Button = $"Control/VBoxContainer/Quit Button"
const START_BUTTON_1 = preload("res://Scenes/TitleScreen/StartButton1.png")
const START_BUTTON_2 = preload("res://Scenes/TitleScreen/StartButton2.png")
const QUIT_BUTTON_1 = preload("res://Scenes/TitleScreen/QuitButton1.png")
const QUIT_BUTTON_2 = preload("res://Scenes/TitleScreen/QuitButton2.png")
const OPTION_BUTTON_1 = preload("res://Scenes/TitleScreen/OptionButton1.png")
const OPTION_BUTTON_2 = preload("res://Scenes/TitleScreen/OptionButton2.png")


func _ready() -> void:
	animation_player.play("Fade Out")
	
func _physics_process(delta: float) -> void:
	if start_button.button_pressed:
		start_button.icon = START_BUTTON_2
	else:
		start_button.icon = START_BUTTON_1
		
	if options_button.button_pressed:
		options_button.icon = OPTION_BUTTON_2
	else:
		options_button.icon = OPTION_BUTTON_1
		
	if quit_button.button_pressed:
		quit_button.icon = QUIT_BUTTON_2
	else:
		quit_button.icon = QUIT_BUTTON_1
		

func _on_quit_button_pressed() -> void:
	animation_player.play("Fade In")
	var timer = get_tree().create_timer(1)
	await timer.timeout
	get_tree().quit()


func _on_start_button_pressed() -> void:
	animation_player.play("Fade In")
	var timer = get_tree().create_timer(1)
	await timer.timeout
	get_tree().change_scene_to_file("res://Scenes/DebugRoom/debug_room.tscn")
