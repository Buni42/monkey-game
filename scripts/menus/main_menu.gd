extends Control

@export var button_hover_audio := AudioStream
@onready var audio_player := get_node("sfx")

func _ready():
	print("this will be the main menu")
	$AnimationPlayer.play("MainMenuStart")

func _process(delta):
	pass


func play_audio(stream):
	if not stream: return
	audio_player.set_stream(stream)
	audio_player.play(0.0)


func stop_audio():
	audio_player.stop()


func mouse_entered():
	play_audio(button_hover_audio)
